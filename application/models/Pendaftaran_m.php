<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pendaftaran_m extends CI_Model
{

	public function get($id = null)
	{
		$this->db->from('tb_user');
		if ($id != null) {
			$this->db->where('id', $id);
		}
		$query = $this->db->get();
		return $query;
	}

	function simpan($post)
	{
		$params['id'] =  "";
		$params['username'] =  $post['username'];
		$params['password'] =  sha1($post['password']);
		$params['nama'] =  $post['nama'];
		$params['tempat_lahir'] =  ucwords(strtolower($post['tempat_lahir']));
		$params['tgl_lahir'] =  $post['tgl_lahir'];
		$params['hp'] =  $post['hp'];
		$params['email'] =  $post['email'];
		$params['created'] =  date("Y:m:d:h:i:sa");
		$params['tipe_user'] =  $post['tipe_user'];
		$this->db->insert('tb_user', $params);
	}

	function hapus($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('tb_user');
	}	
}
