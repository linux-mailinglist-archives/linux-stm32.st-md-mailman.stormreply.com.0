Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56900894082
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 18:30:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19AB2C6B47A;
	Mon,  1 Apr 2024 16:30:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0CB5C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711989053; x=1743525053;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AczA0vvBlhEgaTyRAAogpcX/Z5MI2QUY4sUERwvz+hk=;
 b=ObFcEjHGwb40lU+SM8V7Z/rFMR+R4PRpLeMPz8oVfS1eWpn0+Fm64gN3
 y/Y8f3Dk90f44t/9TRHUqoyCKZBCMqbQG5NHmnY5ZWlvky9pu9stIvfeh
 0YpaH9ugK4yyySCwFikP0/1oOQnDIifW/NTK2g6XTe7DpmGC+4CZX6jIr
 hT9yE0U4z80J7sQtXAPlMrIDoOVSxYpHBHCA1YroubG7UZYzLr/5LVBCu
 0pG8e50VRAGa/XVx38GJ7HJyipKfT/bmKSFqAu9v7as8HUcTwwxP9D1Yg
 mTb2jiLkdSvs4gdCjIRX7QiQ4nNDV1BRg6/f8J9PakWvxuzrP+YKclZ0P g==;
X-CSE-ConnectionGUID: 8pzuUG3CSMOznIZ55rAaBQ==
X-CSE-MsgGUID: GVkdDy3XSzKGJz4QhRiKMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083807"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="10083807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18224603"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:49 -0700
Message-ID: <94a85305-2761-458f-84c9-4d76e59ae11c@linux.intel.com>
Date: Mon, 1 Apr 2024 11:28:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH v2 15/16] ASoC: soc-pcm: indicate warning
 if DPCM BE Codec has no settings
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAzLzMxLzI0IDE5OjMyLCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPiBIaXN0b3JpY2Fs
bHksIEFTb0MgZG9lc24ndCBoYXZlIHZhbGlkYXRpb24gY2hlY2sgZm9yIERQQ00gQkUgQ29kZWMs
Cj4gYnV0IGl0IHNob3VsZCBoYXZlLiBDdXJyZW50IEFTb0MgaXMgaWdub3JpbmcgaXQgc2FtZSBh
cyBiZWZvcmUsCj4gYnV0IGxldCdzIGluZGljYXRlIHRoZSB3YXJuaW5nIGFib3V0IHRoYXQuCj4g
Cj4gVGhpcyB3YXJuaW5nIGFuZCBjb2RlIHNob3VsZCBiZSByZW1vdmVkIGFuZCBjbGVhbnVwZWQg
aWYgRFBDTSBCRSBDb2RlYwo+IGhhcyBuZWNlc3Nhcnkgc2V0dGluZ3MuCj4gT25lIG9mIHRoZSBi
aWcgdXNlciB3aGljaCBkb2Vzbid0IGhhdmUgaXQgaXMgSW50ZWwuCj4gCj4gCS0tLSBzb3VuZC9z
b2MvY29kZWNzL2hkYS5jIC0tLQo+IAo+IAlzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZl
ciBjYXJkX2JpbmRlcl9kYWkgPSB7Cj4gCQkuaWQgPSAtMSwKPiAJCS5uYW1lID0gImNvZGVjLXBy
b2JpbmctREFJIiwKPiArCQkuY2FwdHVyZS5jaGFubmVsc19taW4gPSAxLAo+ICsJCS5wbGF5YmFj
ay5jaGFubmVsc19taW4gPSAxLAo+IAl9Owo+IAo+IAktLS0gc291bmQvcGNpL2hkYS9wYXRjaF9o
ZG1pLmMgLS0tCj4gCj4gCXN0YXRpYyBpbnQgZ2VuZXJpY19oZG1pX2J1aWxkX3BjbXMoLi4uKQo+
IAl7Cj4gCQkuLi4KPiAJCWZvciAoLi4uKSB7Cj4gCQkJLi4uCj4gKwkJCXBzdHItPmNoYW5uZWxz
X21pbiA9IDE7Cj4gCQl9Cj4gCj4gCQlyZXR1cm4gMDsKPiAJfQo+IAo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvYWIzZjBjMGEtNjJmZC1hNDY4LWIzY2YtMGU0YjU5YmFjNmFlQGxp
bnV4LmludGVsLmNvbQo+IENjOiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdp
bnNraUBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8g
PGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2Mvc29j
LXBjbS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9zb2MtcGNtLmMgYi9zb3VuZC9zb2Mvc29jLXBjbS5jCj4gaW5kZXggYWM0MmMw
ODk4MTViLi45NWE1ZTI4ZGVhZDMgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3NvYy1wY20uYwo+
ICsrKyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKPiBAQCAtMjc5Niw3ICsyNzk2LDYgQEAgc3RhdGlj
IGludCBzb2NfZ2V0X3BsYXliYWNrX2NhcHR1cmUoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUg
KnJ0ZCwKPiAgCXN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NoX21hcCAqY2hfbWFwczsKPiAgCXN0
cnVjdCBzbmRfc29jX2RhaSAqY3B1X2RhaTsKPiAgCXN0cnVjdCBzbmRfc29jX2RhaSAqY29kZWNf
ZGFpOwo+IC0Jc3RydWN0IHNuZF9zb2NfZGFpICpkdW1teV9kYWkgPSBzbmRfc29jX2ZpbmRfZGFp
KCZzbmRfc29jX2R1bW15X2RsYyk7Cj4gIAlpbnQgY3B1X3BsYXliYWNrOwo+ICAJaW50IGNwdV9j
YXB0dXJlOwo+ICAJaW50IGhhc19wbGF5YmFjayA9IDA7Cj4gQEAgLTI4MTcsMjQgKzI4MTYsMzYg
QEAgc3RhdGljIGludCBzb2NfZ2V0X3BsYXliYWNrX2NhcHR1cmUoc3RydWN0IHNuZF9zb2NfcGNt
X3J1bnRpbWUgKnJ0ZCwKPiAgCSAqCXNvYy5oIDo6IFtkYWlfbGluay0+Y2hfbWFwcyBJbWFnZSBz
YW1wbGVdCj4gIAkgKi8KPiAgCWZvcl9lYWNoX3J0ZF9jaF9tYXBzKHJ0ZCwgaSwgY2hfbWFwcykg
ewo+IC0JCWNwdV9kYWkJICA9IHNuZF9zb2NfcnRkX3RvX2NwdShydGQsICAgY2hfbWFwcy0+Y3B1
KTsKPiAtCQljb2RlY19kYWkgPSBzbmRfc29jX3J0ZF90b19jb2RlYyhydGQsIGNoX21hcHMtPmNv
ZGVjKTsKPiArCQlpbnQgY3B1X3BsYXlfdCwgY3B1X2NhcHR1cmVfdDsKPiArCQlpbnQgY29kZWNf
cGxheV90LCBjb2RlY19jYXB0dXJlX3Q7Cj4gKwo+ICsJCWNwdV9kYWkJCT0gc25kX3NvY19ydGRf
dG9fY3B1KHJ0ZCwgICBjaF9tYXBzLT5jcHUpOwo+ICsJCWNvZGVjX2RhaQk9IHNuZF9zb2NfcnRk
X3RvX2NvZGVjKHJ0ZCwgY2hfbWFwcy0+Y29kZWMpOwo+ICsKPiArCQljcHVfcGxheV90CT0gc25k
X3NvY19kYWlfc3RyZWFtX3ZhbGlkKGNwdV9kYWksICAgY3B1X3BsYXliYWNrKTsKPiArCQljb2Rl
Y19wbGF5X3QJPSBzbmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY29kZWNfZGFpLCBTTkRSVl9QQ01f
U1RSRUFNX1BMQVlCQUNLKTsKPiArCj4gKwkJY3B1X2NhcHR1cmVfdAk9IHNuZF9zb2NfZGFpX3N0
cmVhbV92YWxpZChjcHVfZGFpLCAgIGNwdV9jYXB0dXJlKTsKPiArCQljb2RlY19jYXB0dXJlX3QJ
PSBzbmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY29kZWNfZGFpLCBTTkRSVl9QQ01fU1RSRUFNX0NB
UFRVUkUpOwo+ICAKPiAgCQkvKgo+IC0JCSAqIEZJWE1FCj4gKwkJICogRklYTUUgLyBDTEVBTi1V
UC1NRQo+ICAJCSAqCj4gIAkJICogRFBDTSBCRSBDb2RlYyBoYXMgYmVlbiBubyBjaGVja2VkIGJl
Zm9yZS4KPiAgCQkgKiBJdCBzaG91bGQgYmUgY2hlY2tlZCwgYnV0IGl0IGJyZWFrcyBjb21wYXRp
YmlsaXR5Lgo+ICAJCSAqIEl0IGlnbm9yZXMgQkUgQ29kZWMgaGVyZSwgc28gZmFyLgo+ICAJCSAq
Lwo+IC0JCWlmIChkYWlfbGluay0+bm9fcGNtKQo+IC0JCQljb2RlY19kYWkgPSBkdW1teV9kYWk7
Cj4gKwkJaWYgKChkYWlfbGluay0+bm9fcGNtKSAmJgo+ICsJCSAgICAoIWNvZGVjX3BsYXlfdCAm
JiAhY29kZWNfY2FwdHVyZV90KSkgewo+ICsJCQlkZXZfd2Fybl9vbmNlKHJ0ZC0+ZGV2LCAiRENQ
TSBCRSBDb2RlYyBoYXMgbm8gc3RyZWFtIHNldHRpbmdzICglcylcbiIsCj4gKwkJCQkgICAgICBj
b2RlY19kYWktPm5hbWUpOwo+ICsJCQljb2RlY19wbGF5X3QJPSAxOwo+ICsJCQljb2RlY19jYXB0
dXJlX3QJPSAxOwo+ICsJCX0KPiAgCj4gLQkJaWYgKHNuZF9zb2NfZGFpX3N0cmVhbV92YWxpZChj
cHVfZGFpLCAgIGNwdV9wbGF5YmFjaykgJiYKPiAtCQkgICAgc25kX3NvY19kYWlfc3RyZWFtX3Zh
bGlkKGNvZGVjX2RhaSwgU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDSykpCj4gKwkJaWYgKGNwdV9w
bGF5X3QgJiYgY29kZWNfcGxheV90KQo+ICAJCQloYXNfcGxheWJhY2sgPSAxOwo+IC0JCWlmIChz
bmRfc29jX2RhaV9zdHJlYW1fdmFsaWQoY3B1X2RhaSwgICBjcHVfY2FwdHVyZSkgJiYKPiAtCQkg
ICAgc25kX3NvY19kYWlfc3RyZWFtX3ZhbGlkKGNvZGVjX2RhaSwgU05EUlZfUENNX1NUUkVBTV9D
QVBUVVJFKSkKPiArCQlpZiAoY3B1X2NhcHR1cmVfdCAmJiBjb2RlY19jYXB0dXJlX3QpCj4gIAkJ
CWhhc19jYXB0dXJlID0gMTsKPiAgCX0KCkFsbCB0aGF0IGNvZGUgc2hvdWxkIGJlIGFkZGVkIGVh
cmxpZXIsIGFuZCB0aGVyZSdzIHN0aWxsIHRoZSBpc3N1ZSB0aGF0CmFsbCB0aGlzIGNvZGUgaXMg
bm93IG92ZXJyaWRkZW4gYnkgdGhlIGRhaV9saW5rIHNldHRpbmdzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
