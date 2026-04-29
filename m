Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKWNBZJG8mmTpQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:57:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95449864F
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 19:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CFB7C87EDB;
	Wed, 29 Apr 2026 17:57:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 254FCC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 17:57:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CDB74E42B57;
 Wed, 29 Apr 2026 17:57:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD8C5FD43;
 Wed, 29 Apr 2026 17:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 430B71072B158; 
 Wed, 29 Apr 2026 19:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777485452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=0Vum2Qfx5+SoYzasekNBMQ+YiKVnGlZJ3ij44o9Xlgc=;
 b=Wg4UW4g2WGpQe+FXph6tsBHWFD0BECvRL8NLGhZLbAiM0dLXtALl0yBqIrD+0Lawp02qRd
 L/DUtmJwUhFvT/7i6dVkrYjSR0i2aqxl97NpsmKlJePMUStXMKAKuFLrdElmd6uDrZQMrW
 DN2MVcdBKW/CmE3V63+VSy0oolOIh9vMJaN/cxw17hZkc97U0ZfuUAPZ4yGanlQWOoatGq
 qp6FDwvx+tvn2k6kj4NlTu0PZO5c6zF2pim5Qlv9CB37AYmDKTUNUAVKAIQsbmXwa4RuM/
 89ov9iKbcYD//Z7K/Ck/zA6aLDSk0p904Hc5ZMnNQ2ekegrqYQiQ3Q5SeoRwvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:37 +0200
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NSw6CMBSF4a2Qjr2mLy7gyH0YB/ShNNHWtKRqC
 Hu3kDBxwPA/g+9MJNnobCKnaiLRZpdc8CXEoSJ66P3dgjOlCae8ZpxKeDuvgjeQEVgLUTPQwY8
 QbW8AUTYdM0ZxFKQIr2hv7rPql2vpwaUxxO96ltmybm6962YGFChTWrYomG7EWYUwPpw/6vAki
 5z5piEVHPc1XjSUwtiu6bHt/7R5nn8RUI1yFgEAAA==
X-Change-ID: 20251204-winbond-v6-18-rc1-cont-read-664791ddb263
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steam Lin <STLin2@winbond.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Santhosh Kumar K <s-k6@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, Pratyush Yadav <pratyush@kernel.org>
Subject: [Linux-stm32] [PATCH v3 00/11] mtd: spinand: Winbond continuous
	read support
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
X-Rspamd-Queue-Id: 8B95449864F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:mwalle@kernel.org,m:miquel.raynal@bootlin.com,m:takahiro.kuwano@infineon.com,m:lorenzo@kernel.org,m:ray.liu@airoha.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:j.neuschaefer@gmx.net,m:thomas.petazzoni@bootlin.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:STLin2@winbond.com,m:linux-spi@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:s-k6@ti.com,m:linux-stm32@st-md-mailman.stormreply.com,m:pratyush@kernel.org,m:taliperry1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,nod.at,ti.com,bootlin.com,infineon.com,airoha.com,aspeedtech.com,kaod.org,jms.id.au,codeconstruct.com.au,gmail.com,google.com,foss.st.com,gmx.net];
	GREYLIST(0.00)[pass,meta];
	NEURAL_SPAM(0.00)[0.934];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

SGVsbG8sCgpUTERSOiBJIGRyb3BwZWQgdjIgZnJvbSBteSB0cmVlIGR1ZSB0byBidWlsZCBpc3N1
ZXMgd2l0aCBTUEkKY29udHJvbGxlcnMgd2hpY2ggSSBmb3Jnb3QgYWJvdXQgZHVlIHRvIG15IHRl
c3RpbmcgY29uZmlndXJhdGlvbiBiZWluZwptaW5pbWFsLiBUaGlzIGlzIGp1c3QgYSByZXNwaW4g
b2YgdGhlIHNhbWUgc2VyaWVzLCBmaXhpbmcgdGhlIHNwaQpjb250cm9sbGVyIGRyaXZlcnMgd2hp
Y2ggSSBpbml0aWFsbHkgbWlzc2VkLgoKU1BJIE5BTkQgY29udGludW91cyByZWFkIHN1cHBvcnQg
aGFzIGFscmVhZHkgYmVlbiBhZGRlZCBhIGZldyByZWxlYXNlcwphZ28sIGJ1dCBvbmx5IE1hY3Jv
bml4IGNoaXBzIHdlcmUgYmVuZWZpdGluZyBmcm9tIHRoaXMgc3VwcG9ydC4gV2luYm9uZApjaGlw
cyBhbHNvIGhhdmUgYSBjb250aW51b3VzIHJlYWQgZmVhdHVyZSwgd2hpY2ggaXMgc2xpZ2h0bHkg
bW9yZQpjb21wbGV4IHRvIHVzZSBpbiB0aGUgc2NvcGUgb2YgdGhlIExpbnV4IGtlcm5lbCwgYmVj
YXVzZSB0aGV5IHRoZXNlCmNoaXBzIGV4cGVjdCBhIGRpZmZlcmVudCByZWFkIGZyb20gY2FjaGUg
b3BlcmF0aW9uIG9uY2UgaW4gY29udGludW91cwptb2RlLgoKSW4gb3JkZXIgdG8gYmUgbW9yZSBm
bGV4aWJsZSwgdGhpcyBzZXJpZXMgY2hhbmdlcyB0aGUgbG9naWMgYmVoaW5kCmRpcm1hcHMuIERp
cmVjdCBtYXBwaW5ncyB1c2VkIHRvIGJlIHZlcnkgc3RhdGljLCBub3QgZmxleGlibGUuIEkgYW0K
cHJvcG9zaW5nIHRvIGNoYW5nZSB0aGlzIGFuZCB0dXJuIHRoZW0gaW4gdG8gc2xpZ2h0bHkgbW9y
ZSBkeW5hbWljCmludGVyZmFjZXMsIHdoZXJlIGZvciBpbnN0YW5jZSB3ZSBjYW46Ci0gRW5hYmxl
L2Rpc2FibGUgdGhlIGNvcnJlY3Rpb24gKHdhcyBwcmV2aW91c2x5IGhhbmRsZWQgYnkgY3JlYXRp
bmcgeWV0CiAgYW5vdGhlciBwYWlyIG9mIGRpcmVjdCBtYXBwaW5ncyBwZXIgdGFyZ2V0KS4KLSBT
ZWxlY3Qgb25lIG9yIGFub3RoZXIgdmFyaWFudCBmb3IgdGhlIGNhY2hlIG9wZXJhdGlvbnMuCgpJ
IHByb3Bvc2UgdG8gbmFtZSB0aGUgdmFyaWFudHMgYXZhaWxhYmxlIGluIGEgZGlyZWN0IG1hcHBp
bmcgInByaW1hcnkiCmFuZCAic2Vjb25kYXJ5IiwgYW5kIGxldCB0aGUgdXBwZXIgbGF5ZXIgKFNQ
SSBOT1Igb3IgU1BJIE5BTkQpIHBvaW50IHRvCnRoZSBvbmUgdGhhdCBuZWVkcyB0byBiZSB1c2Vk
IGZvciB0aGUgb3BlcmF0aW9uLiBDb250cm9sbGVyIGRyaXZlcnMKc2hvdWxkIG5vdCByZWFsbHkg
Y2FyZSBhYm91dCB0aGlzIGNoYW5nZSwgZXhwZWN0IHRoZSBmYWN0IHRoYXQgdGhleQpzaG91bGQg
bm90IGtlZXAgYSBzdGF0aWMgcmVwcmVzZW50YXRpb24gb2YgdGhlIHRlbXBsYXRlIG9uIHRoZWly
CnNpZGUuIEJlY2F1c2Ugb2YgdGhhdCwgSSBhbSBjcmVhdGluZyBhIGNhcGFiaWxpdHkgYm9vbGVh
biB0byBmbGFnCmRyaXZlcnMgdGhhdCBzdXBwb3J0IHRoaXMgY2FwYWJpbGl0eSAodGhlIGZsYWcg
aXMgaWdub3JlZCBpbiB0aGUKbm9kaXJtYXAgY2FzZSkuCgpUaGlzIHNlcmllcyBpcyBub3cgc2Vu
dCBhcyB2MiBmb2xsb3dpbmcgYSBmb3JtZXIgUkZDIChsaW5rIGJlbG93KS4KCkhlcmUgaXMgYSBi
ZW5jaG1hcmsgd2l0aCB0aGUgZmFzdGVyIFdpbmJvbmQgY2hpcCBJIGhhdmUsIFczNU4wMkpXIG9u
IGEKVEkgQU02MmE3IExQIFNLIGZlYXR1cmluZyB0aGUgQ2FkZW5jZSBRU1BJIGNvbnRyb2xsZXIs
IGNsb2NrZWQgYXQKMjVNSHouIFNwZWVkIGdhaW4gZm9yIGEgMTAtcGFnZSByZWFkIGlzIGFib3V0
ICszMiUgaW4gb2N0YWwgU0RSIG1vZGUsCis0NyUgZm9yIGEgMTAtcGFnZSByZWFkIGluIG9jdGFs
IERUUiBtb2RlIGFuZCB1cCB0byArODMlIGZvciBhIGVudGlyZQpibG9jayByZWFkIQoKICAgIDFT
LThTLThTLCBubyBjb250aW51b3VzIHJlYWQ6CgogICAgICAgNjQgcGFnZSByZWFkIHNwZWVkIGlz
IDE1MDU4IEtpQi9zCgogICAgMVMtOFMtOFMsIHdpdGggY29udGludW91cyByZWFkczoKCiAgICAg
ICAxIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNTA1OCBLaUIvcwogICAgICAgMiBwYWdlIHJlYWQgc3Bl
ZWQgaXMgMTUwNTggS2lCL3MKICAgICAgIDMgcGFnZSByZWFkIHNwZWVkIGlzIDE2ODAwIEtpQi9z
CiAgICAgICA0IHBhZ2UgcmVhZCBzcGVlZCBpcyAxNzA2NiBLaUIvcwogICAgICAgNSBwYWdlIHJl
YWQgc3BlZWQgaXMgMTg0NjEgS2lCL3MKICAgICAgIDYgcGFnZSByZWFkIHNwZWVkIGlzIDE4NDYx
IEtpQi9zCiAgICAgICA3IHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTM4NCBLaUIvcwogICAgICAgOCBw
YWdlIHJlYWQgc3BlZWQgaXMgMTk2OTIgS2lCL3MKICAgICAgIDkgcGFnZSByZWFkIHNwZWVkIGlz
IDE5Mzg0IEtpQi9zCiAgICAgICAxMCBwYWdlIHJlYWQgc3BlZWQgaXMgMjAwMDAgS2lCL3MKICAg
ICAgIDExIHBhZ2UgcmVhZCBzcGVlZCBpcyAyMDAwMCBLaUIvcwogICAgICAgMTIgcGFnZSByZWFk
IHNwZWVkIGlzIDIwMDAwIEtpQi9zCiAgICAgICAxMyBwYWdlIHJlYWQgc3BlZWQgaXMgMjA4MDAg
S2lCL3MKICAgICAgIDE0IHBhZ2UgcmVhZCBzcGVlZCBpcyAyMDM2MyBLaUIvcwogICAgICAgMTUg
cGFnZSByZWFkIHNwZWVkIGlzIDIwMDAwIEtpQi9zCiAgICAgICAxNiBwYWdlIHJlYWQgc3BlZWQg
aXMgMTk2OTIgS2lCL3MKICAgICAgIDMyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTY5MiBLaUIvcwog
ICAgICAgNjQgcGFnZSByZWFkIHNwZWVkIGlzIDE5NjkyIEtpQi9zCgogICAgOEQtOEQtOEQsIG5v
IGNvbnRpbnVvdXMgcmVhZDoKCiAgICAgICA2NCBwYWdlIHJlYWQgc3BlZWQgaXMgMjMyNzIgS2lC
L3MKCiAgICA4RC04RC04RCwgd2l0aCBjb250aW51b3VzIHJlYWQ6CgogICAgICAgMSBwYWdlIHJl
YWQgc3BlZWQgaXMgMjMyNzIgS2lCL3MKICAgICAgIDIgcGFnZSByZWFkIHNwZWVkIGlzIDIzMjcy
IEtpQi9zCiAgICAgICAzIHBhZ2UgcmVhZCBzcGVlZCBpcyAyODAwMCBLaUIvcwogICAgICAgNCBw
YWdlIHJlYWQgc3BlZWQgaXMgMzIwMDAgS2lCL3MKICAgICAgIDUgcGFnZSByZWFkIHNwZWVkIGlz
IDM0Mjg1IEtpQi9zCiAgICAgICA2IHBhZ2UgcmVhZCBzcGVlZCBpcyAzNDI4NSBLaUIvcwogICAg
ICAgNyBwYWdlIHJlYWQgc3BlZWQgaXMgMzYwMDAgS2lCL3MKICAgICAgIDggcGFnZSByZWFkIHNw
ZWVkIGlzIDM2NTcxIEtpQi9zCiAgICAgICA5IHBhZ2UgcmVhZCBzcGVlZCBpcyAzNjAwMCBLaUIv
cwogICAgICAgMTAgcGFnZSByZWFkIHNwZWVkIGlzIDM0Mjg1IEtpQi9zCiAgICAgICAxMSBwYWdl
IHJlYWQgc3BlZWQgaXMgMzY2NjYgS2lCL3MKICAgICAgIDEyIHBhZ2UgcmVhZCBzcGVlZCBpcyA0
MDAwMCBLaUIvcwogICAgICAgMTMgcGFnZSByZWFkIHNwZWVkIGlzIDQxNjAwIEtpQi9zCiAgICAg
ICAxNCBwYWdlIHJlYWQgc3BlZWQgaXMgMzczMzMgS2lCL3MKICAgICAgIDE1IHBhZ2UgcmVhZCBz
cGVlZCBpcyA0MDAwMCBLaUIvcwogICAgICAgMTYgcGFnZSByZWFkIHNwZWVkIGlzIDM2NTcxIEtp
Qi9zCiAgICAgICAzMiBwYWdlIHJlYWQgc3BlZWQgaXMgNDI2NjYgS2lCL3MKICAgICAgIDY0IHBh
Z2UgcmVhZCBzcGVlZCBpcyA0MjY2NiBLaUIvcwoKT24gdGhlIE51dm90b24gcGxhdGZvcm0sIHRo
ZSBzcGVlZCBnYWluIGlzIHJlYWwsIGV2ZW4gdGhvdWdoIGl0IGlzIGxlc3MKaW1wcmVzc2l2ZToK
CiAgICAgICAxIHBhZ2UgcmVhZCBzcGVlZCBpcyAxODAyIEtpQi9zCiAgICAgICAyIHBhZ2UgcmVh
ZCBzcGVlZCBpcyAxODgyIEtpQi9zCiAgICAgICAzIHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTM4IEtp
Qi9zCiAgICAgICA0IHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTM5IEtpQi9zCiAgICAgICA1IHBhZ2Ug
cmVhZCBzcGVlZCBpcyAxOTM1IEtpQi9zCiAgICAgICA2IHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTY3
IEtpQi9zCiAgICAgICA3IHBhZ2UgcmVhZCBzcGVlZCBpcyAxOTY4IEtpQi9zCiAgICAgICA4IHBh
Z2UgcmVhZCBzcGVlZCBpcyAxOTY5IEtpQi9zCiAgICAgICA5IHBhZ2UgcmVhZCBzcGVlZCBpcyAx
OTY4IEtpQi9zCiAgICAgICAxMCBwYWdlIHJlYWQgc3BlZWQgaXMgMjAwMCBLaUIvcwogICAgICAg
MTEgcGFnZSByZWFkIHNwZWVkIGlzIDIwMDAgS2lCL3MKICAgICAgIDEyIHBhZ2UgcmVhZCBzcGVl
ZCBpcyAyMDAwIEtpQi9zCiAgICAgICAxMyBwYWdlIHJlYWQgc3BlZWQgaXMgMjAwMCBLaUIvcwog
ICAgICAgMTQgcGFnZSByZWFkIHNwZWVkIGlzIDIwMDAgS2lCL3MKICAgICAgIDE1IHBhZ2UgcmVh
ZCBzcGVlZCBpcyAyMDAwIEtpQi9zCiAgICAgICAxNiBwYWdlIHJlYWQgc3BlZWQgaXMgMjAwMCBL
aUIvcwogICAgICAgMzIgcGFnZSByZWFkIHNwZWVkIGlzIDIwMDAgS2lCL3MKICAgICAgIDY0IHBh
Z2UgcmVhZCBzcGVlZCBpcyAyMDAwIEtpQi9zCgpUaGFua3MhCk1pcXXDqGwKCi0tLQpDaGFuZ2Vz
IGluIHYzOgotIFRoZSBBUEkgY2hhbmdlIGluIHNwaS1tZW0gaGFzIGJlZW4gYXBwbGllZCB0byBh
bGwgU1BJIGNvbnRyb2xsZXIgZHJpdmVycwogIChmaXhpbmcgYnVpbGQgZmFpbHVyZXMgb24gZHJp
dmVycyBJIHdhcyBub3QgYnVpbGRpbmcgaW4gbXkgdGVzdAogIGNvbmZpZykuCiAgVGhhdCBpcyB0
aGUgb25seSBjaGFuZ2UuCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI2MDMyNi13aW5ib25kLXY2LTE4LXJjMS1jb250LXJlYWQtdjItMC02NDNkZTk3YTY4YTNAYm9v
dGxpbi5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlZCBvbiB2Ny4wLXJjMS4KLSBDb2xsZWN0
ZWQgdGFncy4KLSBJIG1hbnVhbGx5IHRlc3RlZCB0aGUgaW50ZWdyaXR5IG9mIHRoZSBkYXRhIGJ5
IG1hbnVhbGx5IGRpc2FibGluZyBhbGwKICBwb3NzaWJsZSB2YXJpYW50cyBvbmUgYWZ0ZXIgdGhl
IG90aGVyIHVzaW5nIGEgMiBwYWdlIHJlYWQgc2NlbmFyaW8uIEFsbAogIHdvcmtlZCBleGNlcHQg
dGhlIGZhc3Rlc3QgOEQtOEQtOEQgdmFyaWFudCAodGhlIGZpcnN0IG9uZSBpbiB0aGUgbGlzdCkK
ICB3aGljaCB0cmlnZ2VyZWQgdGhlIENTIGRlYXNzZXJ0IGlzc3VlIG9uIHRoZSBDYWRlbmNlIGNv
bnRyb2xsZXIuIFRoaXMKICBpc3N1ZSBpcyBvcnRob2dvbmFsIHRvIHRoaXMgcGF0Y2hzZXQsIGEg
Zm9sbG93LXVwIHNlcmllcyB3aWxsIGJlIHNlbnQKICB0byBkaXNhYmxlIGNvbnRpbnVvdXMgcmVh
ZHMgb24gdGhpcyBjb250cm9sbGVyLgotIEFsbCBjb250aW51b3VzIHJlYWQgdmFyaWFudHMgZm9y
IHRoZSBXMjVOeHhKVyBjaGlwcyBoYXZlIGJlZW4gdGVzdGVkCiAgb24gdGhlIE1BMzVEMSBwbGF0
Zm9ybSAod2hpY2ggbGVhZCB0byBzZXZlcmFsIGZpeGVzKSBhbmQgdGhlCiAgVzM1Tnh4SlcgY2hp
cHMgaGF2ZSBiZWVuIHRlc3RlZCBvbiBUSSBBTTYyYTcgTFAgU0suCi0gU2V2ZXJhbCBjaGFuZ2Vz
IGhhdmUgYmVlbiBvcGVyYXRlZCBpbiB0aGUgY29yZSB0byBzdGFiaWxpemUgdGhlCiAgZmVhdHVy
ZSB3aGVuIGEgc2Vjb25kYXJ5IG9wIGlzIHVzZWQuCi0gQSBjb3VwbGUgb2YgaGVscGVycyBoYXZl
IGJlZW4gY3JlYXRlZCB0byBjbGVhbnVwIHRoZSB3aW5ib25kLmMgZHJpdmVyLgotIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEyMDUtd2luYm9uZC12Ni0xOC1yYzEt
Y29udC1yZWFkLXYxLTAtMDFiYzQ4NjMxYzczQGJvb3RsaW4uY29tCgotLS0KTWlxdWVsIFJheW5h
bCAoMTEpOgogICAgICBtdGQ6IHNwaW5hbmQ6IERyb3AgYSB0b28gc3Ryb25nIGxpbWl0YXRpb24K
ICAgICAgbXRkOiBzcGluYW5kOiBFeHBvc2Ugc3BpbmFuZF9vcF9pc19vZHRyKCkKICAgICAgbXRk
OiBzcGluYW5kOiBEcm9wIEVDQyBkaXJtYXBzCiAgICAgIHNwaTogc3BpLW1lbTogVHJhbnNmb3Jt
IHRoZSByZWFkIG9wZXJhdGlvbiB0ZW1wbGF0ZQogICAgICBzcGk6IHNwaS1tZW06IENyZWF0ZSBh
IHNlY29uZGFyeSByZWFkIG9wZXJhdGlvbgogICAgICBtdGQ6IHNwaW5hbmQ6IFVzZSBzZWNvbmRh
cnkgb3BzIGZvciBjb250aW51b3VzIHJlYWRzCiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDog
RW5zdXJlIGNoaXBzIGFyZSBvcmRlcmVkIGJ5IGRlbnNpdHkKICAgICAgbXRkOiBzcGluYW5kOiB3
aW5ib25kOiBBZGQgc3VwcG9ydCBmb3IgY29udGludW91cyByZWFkcyBvbiBXMzVOeHhKVwogICAg
ICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IENyZWF0ZSBhIGhlbHBlciB0byB3cml0ZSB0aGUgSFMg
Yml0CiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogQ3JlYXRlIGEgaGVscGVyIHRvIGRldGVj
dCB0aGUgbmVlZCBmb3IgdGhlIEhTIGJpdAogICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEFk
ZCBzdXBwb3J0IGZvciBjb250aW51b3VzIHJlYWRzIG9uIFcyNU54eEpXCgogZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jICAgIHwgMTM1ICsrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jIHwgMzE3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAgfCAgMjIgKy0tCiBkcml2
ZXJzL3NwaS9zcGktYWlyb2hhLXNuZmkuYyAgfCAgIDYgKy0KIGRyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMgICB8ICAgNCArLQogZHJpdmVycy9zcGkvc3BpLWludGVsLmMgICAgICAgIHwgICA2
ICstCiBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgICAgfCAgMzIgKysrKy0KIGRyaXZlcnMv
c3BpL3NwaS1teGljLmMgICAgICAgICB8ICAxOCArLS0KIGRyaXZlcnMvc3BpL3NwaS1ucGNtLWZp
dS5jICAgICB8ICAxNiArLS0KIGRyaXZlcnMvc3BpL3NwaS1ycGMtaWYuYyAgICAgICB8ICAgOCAr
LQogZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYyAgIHwgICA2ICstCiBkcml2ZXJzL3NwaS9z
cGktc3RtMzItcXNwaS5jICAgfCAgIDYgKy0KIGRyaXZlcnMvc3BpL3NwaS13cGNtLWZpdS5jICAg
ICB8ICAgMiArLQogaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oICAgIHwgIDE2ICsrLQogaW5j
bHVkZS9saW51eC9zcGkvc3BpLW1lbS5oICAgIHwgICA4ICstCiAxNSBmaWxlcyBjaGFuZ2VkLCA0
MzUgaW5zZXJ0aW9ucygrKSwgMTY3IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDFlMGZl
ODM5ZjhjNGJhZGU3YjlkYzM1OGZiOGVlZjViMmY0M2FmNDkKY2hhbmdlLWlkOiAyMDI1MTIwNC13
aW5ib25kLXY2LTE4LXJjMS1jb250LXJlYWQtNjY0NzkxZGRiMjYzCgpCZXN0IHJlZ2FyZHMsCi0t
IApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
