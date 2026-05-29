Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKdjLxxEGWqNuAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:45:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D35FEBF5
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:45:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6111EC8F291;
	Fri, 29 May 2026 07:45:31 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6724C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=ib7Ut0SfSUbe54vHfazcErQh/0J2DlD47lgc4LGMbCM=;
 b=Nete6hT04hIRmZhZBhxZ4uB3g3iLGdJMNAFbsfrlKtX78aTJg9uWmNr30ZboX6
 nEqxR2S7SCF4pR0ZMcsSWWDeiC/9WLXa5RBXWlYPQo/Quu3Y9RIheNjXdQoRdqid
 JeuviavYa30MfhSup/GMzinyvBxn1y4iarh4ngePCzMcQ=
Received: from PC-YLX4CAEK.company.local (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wDHv0t5Qxlqea_vAA--.36333S2; 
 Fri, 29 May 2026 15:42:50 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: j.raczynski@samsung.com
Date: Fri, 29 May 2026 15:42:49 +0800
Message-Id: <20260529074249.2640274-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
References: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHv0t5Qxlqea_vAA--.36333S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry8Aw1rCFW5ur17Cw1Dtrb_yoWrGF45p3
 yYkw4DtryDGr18tws5Aw48ZFyYvayrJrW5u34DG342k3y5urnavr4aqw4Yva9rur1v9340
 qr45Z3y8CFyvvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_nmiJUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0hvP+2oZQ3uJmwAA3k
Cc: andrew@lunn.ch, pabeni@redhat.com, xiasanbo@lixiang.com,
 yangchen11@lixiang.com, dinghui@lixiang.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, liuxuanjun@lixiang.com,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk, kuba@kernel.org,
 maxime.chevallier@bootlin.com, dinghui1111@163.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix fatal bus error on
	resume by reinitializing RX buffers
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:j.raczynski@samsung.com,m:andrew@lunn.ch,m:pabeni@redhat.com,m:xiasanbo@lixiang.com,m:yangchen11@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:liuxuanjun@lixiang.com,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:kuba@kernel.org,m:maxime.chevallier@bootlin.com,m:dinghui1111@163.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lunn.ch,redhat.com,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,armlinux.org.uk,kernel.org,bootlin.com,163.com,davemloft.net,lists.infradead.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[163.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.020];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,samsung.com:email]
X-Rspamd-Queue-Id: 553D35FEBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QXQgMjAyNi0wNS0yOCAyMjo1NzozOCwgIkpha3ViIFJhY3p5bnNraSIgPGoucmFjenluc2tpQHNh
bXN1bmcuY29tPiB3cm90ZToKPk9uIFR1ZSwgTWF5IDI2LCAyMDI2IGF0IDEwOjI2OjE3QU0gKzA4
MDAsIERpbmcgSHVpIHdyb3RlOgo+PiBGcm9tOiBEaW5nIEh1aSA8ZGluZ2h1aUBsaXhpYW5nLmNv
bT4KPj4gKwkJfSBlbHNlIHsKPj4gKwkJCS8qIFRoZW9yZXRpY2FsbHkgdW5yZWFjaGFibGU6IG5h
cGlfZGlzYWJsZSgpIGluCj4+ICsJCQkgKiBzdG1tYWNfc3VzcGVuZCgpIGVuc3VyZXMgYWxsIGlu
aXRpYWxpemVkIHNsb3RzCj4+ICsJCQkgKiBoYXZlIGEgdmFsaWQgcGFnZSBiZWZvcmUgd2UgZ2V0
IGhlcmUuCj4+ICsJCQkgKiBEZWZlbnNpdmUgY2hlY2sgb25seS4KPj4gKwkJCSAqLwo+PiArCQkJ
aWYgKCFidWYtPnBhZ2UpCj4+ICsJCQkJY29udGludWU7Cj4+ICsKPj4gKwkJCXN0bW1hY19zZXRf
ZGVzY19hZGRyKHByaXYsIHAsIGJ1Zi0+YWRkcik7Cj4+ICsJCQlzdG1tYWNfc2V0X2Rlc2Nfc2Vj
X2FkZHIocHJpdiwgcCwgYnVmLT5zZWNfYWRkciwKPj4gKwkJCQkJCSBwcml2LT5zcGhfYWN0aXZl
ICYmCj4+ICsJCQkJCQkgYnVmLT5zZWNfcGFnZSk7Cj4KPkl0IHRoaXMgZ2VuZXJhbGx5IHN1ZmZp
Y2llbnQ/ICBPciwgaW4gZmFjdCwgaXNuJ3QgdGhhdCBvdmVya2lsbD8KPnN0bW1hY19yeF9yZWZp
bGwoKSBnZW5lcmFsbHkgZG9lcyBhIGJpdCBtb3JlIHByZXBhcmF0aW9uIG9mIGRlc2NyaXB0b3Jz
LgoKWW91IGFyZSByaWdodCB0aGF0IHN0bW1hY19yeF9yZWZpbGwoKSBkb2VzIG1vcmUgd29yayDi
gJQgaXQgYWxsb2NhdGVzIG5ldwpwYWdlcyBhbmQgbWFwcyB0aGVtLiBUaGUga2V5IGRpZmZlcmVu
Y2UgaGVyZSBpcyB0aGF0IGluIHYyIHdlIGludGVudGlvbmFsbHkKa2VlcCBhbGwgUlggYnVmZmVy
cyBhbGl2ZSBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUsIHNvIG5vIGFsbG9jYXRpb24gaXMgbmVlZGVk
LgpUaGUgb25seSB0aGluZyB0aGF0IG5lZWRzIHRvIGJlIHJlc3RvcmVkIGlzIHRoZSBidWZmZXIg
YWRkcmVzcyBmaWVsZHMgaW4gdGhlCmRlc2NyaXB0b3JzLCB3aGljaCB3ZXJlIG92ZXJ3cml0dGVu
IGJ5IGhhcmR3YXJlIHdyaXRlLWJhY2suCgo+VGhlIGlzc3VlIHNlZW1zIHRvIGJlIHRoYXQgZHVy
aW5nIHN1c3BlbmQgdGhlcmUgaXMgbWlzbWF0Y2gsCj5jYXVzZWQgYnkgd3JpdGViYWNrIGZvcm1h
dCwgYmV0d2VlbiByeF9kaXJ0eSBhbmQgcnhfY3VyIHBvaW50ZXJzIGFuZAo+dGhlcmUgaXMgYmFk
IGhhbmRsaW5nIG9mIHRoaXMgY2FzZSwgc2luY2UgdGhlcmUgaXMgbm8gdmVyaWZpY2F0aW9uCj5v
ZiBsZWZ0b3ZlciBzdHVmZiBhbmQgdGhlcmUgd2lsbCBiZSBsZWZ0b3ZlciBiYWQgYWRkcmVzcyBj
cmFzaGluZyBwbGF0Zm9ybS4KPlNvIHN0bW1hYyBuZWVkcyB0byByZWZpbGwvcmVpbml0IGRlc2Ny
aXB0b3JzIHRoYXQgd2VyZSBjb25zdW1lZCBidXQgbm90Cj5yZWZpbGxlZC4gU28gaXNuJ3QgZ29p
bmcgdGhyb3VnaCB3aG9sZSBkbWFfcnhfc2l6ZSBvdmVya2lsbD8KPldvdWxkbid0IGl0IGJlIGJl
dHRlciB0byBpdGVyYXRlIG92ZXIgYnVmZmVyIGZyb20gY3VyX3J4IGFzIGxvbmcgYXMgZGVzY3Jp
cHRvcnMKPmFyZSAwIGFuZCBvbmx5IGFwcGx5IHJlZmlsbCB0byB0aG9zZSBjb3JydXB0ZWQ/CgpB
Y3R1YWxseSwgVGhlIGhhcmR3YXJlIG1heSBoYXZlIGNvbnN1bWVkIGFkZGl0aW9uYWwgZGVzY3Jp
cHRvcnMgaW4gdGhlIHdpbmRvdwpiZXR3ZWVuIHN0bW1hY19kaXNhYmxlX2FsbF9xdWV1ZXMoKSBh
bmQgc3RtbWFjX3N0b3BfYWxsX2RtYSgpLCBzbyBjdXJfcnggY2FuIGxhZwpiZWhpbmQgdGhlIGhh
cmR3YXJlJ3MgYWN0dWFsIHBvc2l0aW9uLiBTbyBtYXliZSBub3Qgb25seSB0aGUgZGVzY3JpcHRv
cnMgYmV0d2VlbgpyeF9kaXJ0eSBhbmQgcnhfY3VyIHBvaW50ZXJzIG5lZWQgdG8gYmUgcmVmaWxs
ZWQuIApZb3UgYXJlIHJpZ2h0IHRoYXQgd2Ugc2hvdWxkIG9ubHkgcmVmaWxsIHRoZSBjb25zdW1l
ZCBkZXNjcmlwdG9ycy4gQnV0IGNoZWNraW5nIHRoZQpPV04gYml0IHJlcXVpcmVzIGEgbmV3IGxp
Z2h0d2VpZ2h0IGdldF9yeF9vd25lcigpIGhlbHBlciBhY3Jvc3MgYWxsIGRlc2NyaXB0b3IKdmFy
aWFudHMgKGR3bWFjNCwgZHd4Z21hYzIsIG5vcm1fZGVzYywgZW5oX2Rlc2MpLCBhZGRpbmcgY29t
cGxleGl0eSBmb3IgbWFyZ2luYWwgZ2Fpbi4KCj5Db3VsZCB5b3UgcGFzdGUgcGFuaWMgdGhhdCBv
Y2N1cnMgZHVyaW5nIHRoaXMgaXNzdWU/Cj5Zb3UgbWVudGlvbiAiZmF0YWwgYnVzIGVycm9yIiB3
aGljaCBJIHdvdWxkIGFzc3VtZSBpcyBzeXN0ZW0gcGFuaWM/CgpBcG9sb2dpZXMgZm9yIHRoZSBt
aXNsZWFkaW5nIHdvcmRpbmcg4oCUIHRoaXMgZG9lcyBub3QgY2F1c2UgYSBrZXJuZWwgcGFuaWMu
ClRoZSBpc3N1ZSBtYW5pZmVzdHMgYXMgYSBGYXRhbCBCdXMgRXJyb3IgaW50ZXJydXB0IG9uIHRo
ZSBETUEgY29udHJvbGxlci4KVGFraW5nIFhHTUFDIGFzIGFuIGV4YW1wbGUsIGR3eGdtYWMyX2Rt
YV9pbnRlcnJ1cHQoKSBkZXRlY3RzIFhHTUFDX0ZCRSwKaW5jcmVtZW50cyBmYXRhbF9idXNfZXJy
b3JfaXJxLCBhbmQgcmV0dXJucyB0eF9oYXJkX2Vycm9yLCB3aGljaCB0cmlnZ2VycwpzdG1tYWNf
dHhfZXJyKCkgdG8gc3RvcCBhbmQgcmVzZXQgdGhlIFRYIERNQSBjaGFubmVsLiBCdXQgdGhpcyBo
YXMgbm8gZWZmZWN0CmZvciB0aGUgUlggRE1BIGVuZ2luZSAobWF5IGJlIHdlIHNob3VsZCByZXNl
dCBSWCBETUEgaGVyZSkuIFRoZSBwcmFjdGljYWwgZWZmZWN0CmlzIHRoYXQgdGhlIFJYIERNQSBl
bmdpbmUgaGFsdHMgYWZ0ZXIgZGVyZWZlcmVuY2luZyB0aGUgaW52YWxpZCBidWZmZXIgYWRkcmVz
cywKYW5kIHRoZSBuZXR3b3JrIGludGVyZmFjZSBiZWNvbWVzIG5vbi1mdW5jdGlvbmFsIGFmdGVy
IHJlc3VtZSDigJQgbm8gcGFja2V0cyBjYW4gYmUKcmVjZWl2ZWQgdW50aWwgdGhlIGRyaXZlciBp
cyByZWxvYWRlZCBvciB0aGUgZGV2aWNlIGlzIHJlLXByb2JlZC4KClRvIHJlcHJvZHVjZSB0aGUg
aXNzdWUgb24gbXkgcGxhdGZvcm06CiAgMS4gQ29ubmVjdCB0aGUgRFVUIGFuZCBhIFBDLCBjb25m
aWd1cmUgSVAgYWRkcmVzc2VzIHNvIHRoZXkgY2FuIHBpbmcKICAgICBlYWNoIG90aGVyIChlLmcu
IERVVDogMTkyLjE2OC4xLjEsIFBDOiAxOTIuMTY4LjEuMTAwKS4KCiAgMi4gT24gdGhlIFBDLCBz
dGFydCBhbiBpcGVyZjMgc2VydmVyOgogICAgICAgaXBlcmYzIC1zCgogIDMuIE9uIHRoZSBEVVQs
IHN0YXJ0IGEgaGlnaC1yYXRlIHJldmVyc2UgVURQIHN0cmVhbSB0byBrZWVwIHRoZSBSWCBETUEK
ICAgICBidXN5IGR1cmluZyBzdXNwZW5kOgogICAgICAgaXBlcmYzIC1jIDE5Mi4xNjguMS4xMDAg
LXUgLWIgOTAwTSAtUiAtdCAwCgogIDQuIFdoaWxlIGlwZXJmMyBpcyBydW5uaW5nLCB0cmlnZ2Vy
IGEgc3VzcGVuZC9yZXN1bWUgY3ljbGUgb24gdGhlIERVVC4KCiAgNS4gQWZ0ZXIgcmVzdW1lLCBj
aGVjayB0aGUgZmF0YWxfYnVzX2Vycm9yX2lycSBjb3VudGVyOgogICAgICAgZXRodG9vbCAtUyA8
aWZhY2U+IHwgZ3JlcCBmYXRhbF9idXNfZXJyb3JfaXJxCgogICAgIFdpdGhvdXQgdGhpcyBmaXgg
dGhlIGNvdW50ZXIgaW5jcmVtZW50cyBhbmQgdGhlIGludGVyZmFjZSBzdG9wcwogICAgIHJlY2Vp
dmluZyBwYWNrZXRzLiBXaXRoIHRoaXMgZml4IHRoZSBjb3VudGVyIHN0YXlzIGF0IHplcm8gYW5k
CiAgICAgbm9ybWFsIG9wZXJhdGlvbiByZXN1bWVzLgoKSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0
IG1lc3NhZ2UgdG8gY2xhcmlmeSAiZmF0YWwgYnVzIGVycm9yIGNhdXNpbmcgUlgKRE1BIHRvIHN0
b3AiLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKRGluZyBIdWkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
