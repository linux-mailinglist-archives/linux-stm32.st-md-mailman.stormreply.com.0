Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524FA5671C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 12:52:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD5ADC78034;
	Fri,  7 Mar 2025 11:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE898C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741348367; x=1772884367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HfAgk9zOtpbfUTR/ph6GVkTV0/0ByfBX3QerezGYdeI=;
 b=YfygnyBlsAm33M3Ckcu/rLjJ/ZdwvUBapNdtYh0WPNBRb+nD47CpgV3s
 6SgO18XT4xYu4+5HTBARLY9WsFl5QFfbaCMzbi8hAgPWPjvqpdE0HNBMk
 dMEPCeUSyYDaVB0Ga6V1+35hGRULvROPiUXhLPDc2O1fVKkIu9yZaZ07p
 OqAFKjtQWH2/g+JCsJDN/QMmiqtyFzMrI+c+SXfYLX+WKZ7NLNspsOCRh
 diBKdFnDnNNmbHzvBjwdinI6tgBq9U6pcvJUP6TsncvK8xDHD6UxPi0Ef
 KII29hnUwCSdBB+wG1CyqkdAWjFxmiAmtg0V8D0hJdbqreRH55mQkqU1M Q==;
X-CSE-ConnectionGUID: oCKTA2GSTYu9B5Byb1Crjw==
X-CSE-MsgGUID: T16LVNB+TDOy8m2+A/1l/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64834320"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="64834320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:52:44 -0800
X-CSE-ConnectionGUID: Gq2NhXteTvWPF9+DnKuFJQ==
X-CSE-MsgGUID: opl3JIbRQVSlCkVEbStQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120226099"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177])
 ([10.247.100.177])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:52:36 -0800
Message-ID: <43277258-7100-4230-82da-8a78ad341dde@linux.intel.com>
Date: Fri, 7 Mar 2025 19:52:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-8-faizal.abdul.rahim@linux.intel.com>
 <20250306002825.rva7wjsymmms7kbd@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306002825.rva7wjsymmms7kbd@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v8 07/11] igc: add support for
 frame preemption verification
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA2LzMvMjAyNSA4OjI4IGFtLCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6Cj4gT24gV2VkLCBN
YXIgMDUsIDIwMjUgYXQgMDg6MDA6MjJBTSAtMDUwMCwgRmFpemFsIFJhaGltIHdyb3RlOgo+PiBD
by1kZXZlbG9wZWQtYnk6IFZpbmljaXVzIENvc3RhIEdvbWVzIDx2aW5pY2l1cy5nb21lc0BpbnRl
bC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZpbmljaXVzIENvc3RhIEdvbWVzIDx2aW5pY2l1cy5n
b21lc0BpbnRlbC5jb20+Cj4+IENvLWRldmVsb3BlZC1ieTogQ2hvb25nIFlvbmcgTGlhbmcgPHlv
bmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hvb25n
IFlvbmcgTGlhbmcgPHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbT4KPj4gQ28tZGV2
ZWxvcGVkLWJ5OiBDaHdlZS1MaW4gQ2hvb25nIDxjaHdlZS5saW4uY2hvb25nQGludGVsLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogQ2h3ZWUtTGluIENob29uZyA8Y2h3ZWUubGluLmNob29uZ0BpbnRl
bC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhaXphbCBSYWhpbSA8ZmFpemFsLmFiZHVsLnJhaGlt
QGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpZ2Nf
ZnBlX2lzX3ZlcmlmeV9vcl9yZXNwb25zZSh1bmlvbiBpZ2NfYWR2X3J4X2Rlc2MgKnJ4X2Rlc2Ms
Cj4+ICsJCQkJCQkgdW5zaWduZWQgaW50IHNpemUsIHZvaWQgKnBrdGJ1ZikKPj4gK3sKPj4gKwl1
MzIgc3RhdHVzX2Vycm9yID0gbGUzMl90b19jcHUocnhfZGVzYy0+d2IudXBwZXIuc3RhdHVzX2Vy
cm9yKTsKPj4gKwlzdGF0aWMgY29uc3QgdTggemVyb19wYXlsb2FkW1NNRF9GUkFNRV9TSVpFXSA9
IHswfTsKPj4gKwlpbnQgc21kOwo+PiArCj4+ICsJc21kID0gRklFTERfR0VUKElHQ19SWERBRFZf
U1RBVF9TTURfVFlQRV9NQVNLLCBzdGF0dXNfZXJyb3IpOwo+PiArCj4+ICsJcmV0dXJuIChzbWQg
PT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1YgfHwgc21kID09IElHQ19SWERfU1RBVF9TTURfVFlQ
RV9SKSAmJgo+PiArCQlzaXplID09IFNNRF9GUkFNRV9TSVpFICYmCj4+ICsJCSFtZW1jbXAocGt0
YnVmLCB6ZXJvX3BheWxvYWQsIFNNRF9GUkFNRV9TSVpFKTsgLyogQnVmZmVyIGlzIGFsbCB6ZXJv
cyAqLwo+IAo+IFVzaW5nIHRoaXMgZGVmaW5pdGlvbi4uLgo+IAo+PiArfQo+PiArCj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgaWdjX2ZwZV9scF9ldmVudF9zdGF0dXModW5pb24gaWdjX2Fkdl9yeF9k
ZXNjICpyeF9kZXNjLAo+PiArCQkJCQkgICBzdHJ1Y3QgZXRodG9vbF9tbXN2ICptbXN2KQo+PiAr
ewo+PiArCXUzMiBzdGF0dXNfZXJyb3IgPSBsZTMyX3RvX2NwdShyeF9kZXNjLT53Yi51cHBlci5z
dGF0dXNfZXJyb3IpOwo+PiArCWludCBzbWQ7Cj4+ICsKPj4gKwlzbWQgPSBGSUVMRF9HRVQoSUdD
X1JYREFEVl9TVEFUX1NNRF9UWVBFX01BU0ssIHN0YXR1c19lcnJvcik7Cj4+ICsKPj4gKwlpZiAo
c21kID09IElHQ19SWERfU1RBVF9TTURfVFlQRV9WKQo+PiArCQlldGh0b29sX21tc3ZfZXZlbnRf
aGFuZGxlKG1tc3YsIEVUSFRPT0xfTU1TVl9MUF9TRU5UX1ZFUklGWV9NUEFDS0VUKTsKPj4gKwll
bHNlIGlmIChzbWQgPT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1IpCj4+ICsJCWV0aHRvb2xfbW1z
dl9ldmVudF9oYW5kbGUobW1zdiwgRVRIVE9PTF9NTVNWX0xQX1NFTlRfUkVTUE9OU0VfTVBBQ0tF
VCk7Cj4+ICt9Cj4+IEBAIC0yNjE3LDYgKzI2MTcsMTUgQEAgc3RhdGljIGludCBpZ2NfY2xlYW5f
cnhfaXJxKHN0cnVjdCBpZ2NfcV92ZWN0b3IgKnFfdmVjdG9yLCBjb25zdCBpbnQgYnVkZ2V0KQo+
PiAgIAkJCXNpemUgLT0gSUdDX1RTX0hEUl9MRU47Cj4+ICAgCQl9Cj4+ICAgCj4+ICsJCWlmIChp
Z2NfZnBlX2lzX3BtYWNfZW5hYmxlZChhZGFwdGVyKSAmJgo+PiArCQkgICAgaWdjX2ZwZV9pc192
ZXJpZnlfb3JfcmVzcG9uc2UocnhfZGVzYywgc2l6ZSwgcGt0YnVmKSkgewo+IAo+IC4uLiBpbnZh
bGlkIFNNRC1SIGFuZCBTTUQtViBmcmFtZXMgd2lsbCBza2lwIHRoaXMgY29kZSBibG9jayBhbHRv
Z2V0aGVyLCBhbmQKPiB3aWxsIGJlIHBhc3NlZCB1cCB0aGUgbmV0d29yayBzdGFjaywgYW5kIHZp
c2libGUgYXQgbGVhc3QgaW4gdGNwZHVtcCwgY29ycmVjdD8KPiBFc3NlbnRpYWxseSwgaWYgdGhl
IGxpbmsgcGFydG5lciB3b3VsZCBjcmFmdCBhbiBJQ01QIHJlcXVlc3QgcGFja2V0IHdpdGgKPiBh
biBTTUQtViBvciBTTUQtUiwgeW91ciBzdGF0aW9uIHdvdWxkIHJlc3BvbmQgdG8gaXQsIHdoaWNo
IGlzIGluY29ycmVjdC4KPiAKPiBBIGJpdCBzdHJhbmdlLCB0aGUgYmVoYXZpb3IgaW4gdGhpcyBj
YXNlIHNlZW1zIGEgYml0IHVuZGVyLXNwZWNpZmllZCBpbgo+IHRoZSBzdGFuZGFyZCwgYW5kIEkg
ZG9uJ3Qgc2VlIGFueSBjb3VudGVyIHRoYXQgc2hvdWxkIGJlIGluY3JlbWVudGVkLgo+IAo+PiAr
CQkJaWdjX2ZwZV9scF9ldmVudF9zdGF0dXMocnhfZGVzYywgJmFkYXB0ZXItPmZwZS5tbXN2KTsK
Pj4gKwkJCS8qIEFkdmFuY2UgdGhlIHJpbmcgbmV4dC10by1jbGVhbiAqLwo+PiArCQkJaWdjX2lz
X25vbl9lb3AocnhfcmluZywgcnhfZGVzYyk7Cj4+ICsJCQljbGVhbmVkX2NvdW50Kys7Cj4+ICsJ
CQljb250aW51ZTsKPj4gKwkJfQo+IAo+IFRvIGZpeCB0aGlzLCBkb24ndCB5b3Ugd2FudCB0byBt
ZXJnZSB0aGUgdW5uYXR1cmFsbHkgc3BsaXQKPiBpZ2NfZnBlX2lzX3ZlcmlmeV9vcl9yZXNwb25z
ZSgpIGFuZCBpZ2NfZnBlX2xwX2V2ZW50X3N0YXR1cygpIGludG8gYQo+IHNpbmdsZSBmdW5jdGlv
biwgd2hpY2ggcmV0dXJucyB0cnVlIHdoZW5ldmVyIHRoZSBtUGFja2V0IHNob3VsZCBiZQo+IGNv
bnN1bWVkIGJ5IHRoZSBkcml2ZXIsIGJ1dCBkZWNpZGVzIHdoZXRoZXIgdG8gZW1pdCBhIG1tc3Yg
ZXZlbnQgb24gaXRzCj4gb3duPyBNZXJnaW5nIHRoZSB0d28gd291bGQgYWxzbyBhdm9pZCByZWFk
aW5nIHJ4X2Rlc2MtPndiLnVwcGVyLnN0YXR1c19lcnJvcgo+IHR3aWNlLgo+IAo+IFNvbWV0aGlu
ZyBsaWtlIHRoaXM6Cj4gCj4gc3RhdGljIGlubGluZSBib29sIGlnY19mcGVfaGFuZGxlX21wYWNr
ZXQoc3RydWN0IGlnY19hZGFwdGVyICphZGFwdGVyLAo+IAkJCQkJICB1bmlvbiBpZ2NfYWR2X3J4
X2Rlc2MgKnJ4X2Rlc2MsCj4gCQkJCQkgIHVuc2lnbmVkIGludCBzaXplLCB2b2lkICpwa3RidWYp
Cj4gewo+IAl1MzIgc3RhdHVzX2Vycm9yID0gbGUzMl90b19jcHUocnhfZGVzYy0+d2IudXBwZXIu
c3RhdHVzX2Vycm9yKTsKPiAJaW50IHNtZDsKPiAKPiAJc21kID0gRklFTERfR0VUKElHQ19SWERB
RFZfU1RBVF9TTURfVFlQRV9NQVNLLCBzdGF0dXNfZXJyb3IpOwo+IAlpZiAoc21kICE9IElHQ19S
WERfU1RBVF9TTURfVFlQRV9WICYmIHNtZCAhPSBJR0NfUlhEX1NUQVRfU01EX1RZUEVfUikKPiAJ
CXJldHVybiBmYWxzZTsKPiAKPiAJaWYgKHNpemUgPT0gU01EX0ZSQU1FX1NJWkUgJiYgbWVtX2lz
X3plcm8ocGt0YnVmLCBTTURfRlJBTUVfU0laRSkpIHsKPiAJCXN0cnVjdCBldGh0b29sX21tc3Yg
Km1tc3YgPSAmYWRhcHRlci0+ZnBlLm1tc3Y7Cj4gCQllbnVtIGV0aHRvb2xfbW1zdl9ldmVudCBl
dmVudDsKPiAKPiAJCWlmIChzbWQgPT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1YpCj4gCQkJZXZl
bnQgPSBFVEhUT09MX01NU1ZfTFBfU0VOVF9WRVJJRllfTVBBQ0tFVDsKPiAJCWVsc2UKPiAJCQll
dmVudCA9IEVUSFRPT0xfTU1TVl9MUF9TRU5UX1JFU1BPTlNFX01QQUNLRVQ7Cj4gCj4gCQlldGh0
b29sX21tc3ZfZXZlbnRfaGFuZGxlKG1tc3YsIGV2ZW50KTsKPiAJfQo+IAo+IAlyZXR1cm4gdHJ1
ZTsKPiB9Cj4gCj4gCQlpZiAoaWdjX2ZwZV9pc19wbWFjX2VuYWJsZWQoYWRhcHRlcikgJiYKPiAJ
CSAgICBpZ2NfZnBlX2hhbmRsZV9tcGFja2V0KGFkYXB0ZXIsIHJ4X2Rlc2MsIHNpemUsIHBrdGJ1
ZikpIHsKPiAJCQkvKiBBZHZhbmNlIHRoZSByaW5nIG5leHQtdG8tY2xlYW4gKi8KPiAJCQlpZ2Nf
aXNfbm9uX2VvcChyeF9yaW5nLCByeF9kZXNjKTsKPiAJCQljbGVhbmVkX2NvdW50Kys7Cj4gCQkJ
Y29udGludWU7Cj4gCQl9Cj4gCj4gWyBhbHNvIHJlbWFyayB0aGUgdXNlIG9mIG1lbV9pc196ZXJv
KCkgaW5zdGVhZCBvZiBtZW1jbXAoKSB3aXRoIGEgYnVmZmVyCj4gICAgcHJlLWZpbGxlZCB3aXRo
IHplcm9lcy4gSXQgc2hvdWxkIGJlIG1vcmUgZWZmaWNpZW50LCBmb3IgdGhlIHNpbXBsZQo+ICAg
IHJlYXNvbiB0aGF0IGl0J3MgYWNjZXNzaW5nIGEgc2luZ2xlIG1lbW9yeSBidWZmZXIgYW5kIG5v
dCB0d28uIFRob3VnaAo+ICAgIEknbSBzdXJwcmlzZWQgaG93IHdpZGVzcHJlYWQgdGhlIG1lbWNt
cCgpIHBhdHRlcm4gaXMgdGhyb3VnaG91dCB0aGUKPiAgICBrZXJuZWwuIF0KClRoYW5rcyBmb3Ig
dGhlIHN1Z2dlc3Rpb27igJRpdCByZWFkcyBtdWNoIGJldHRlciBhbmQgZmxvd3Mgc21vb3RobHku
IEdvdCBpdCAKb24gdGhlIGRyaXZlciBuZWVkaW5nIHRvIGNvbnN1bWUgYSBub24temVybyBwYWNr
ZXQgYnVmZmVyIGZyb20gU01ELVYgYW5kIFNNRC1SLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
