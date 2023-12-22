Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D554381CA02
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 13:30:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A15FC6C841;
	Fri, 22 Dec 2023 12:30:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 614D8C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 12:30:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40d3dfcc240so16800515e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 04:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703248227; x=1703853027;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VShQOkDyOQUhX9HywN+ltueUtPe5q/n3T/gBT1xnywc=;
 b=NR2lwAGPw+J24+TM+c1v8ES5BeJrQWRbO6s5e3bMEP7++TzOC1O4KZ9CPzfUKmCTbx
 eldnZTOC6HsQDZ5+o2nVp+knOJIEf6BXbWzGMR1HxWhcdZOYnNPuxmZfs4dIvCNwewYS
 lBQd/DeecRvmeCBGRAwB6iCNTE57/BNZuFZ1UsLejUSlwuChPK5v0BhdtOZ/GlvxLRBK
 6c8CMb3+XpfPWnHnGgICXY1Zmdjtq1ZdIbC03yvJ/C4TL0AxAEDC8i81XxWfm3aQTd3J
 rZ6PLHBVqLEZSqJo8y/LkCR7FQE50G4jHLiGKhFX4dlMDD9ZPXh4pTDH0/Q/p93wWv2o
 vinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703248227; x=1703853027;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VShQOkDyOQUhX9HywN+ltueUtPe5q/n3T/gBT1xnywc=;
 b=SyuFqtlr+hcsimfjcOanm5l1dWKYehzhZZ69CpwA1PhOLJxcXHPvidsnls0H13PcMM
 Yu7v4TwBhh2jlHIwV0XesqE5r+JWbuwAx5II/2+qj8MfcbEabWn2bds4JdmEFSjI0hE0
 UMYVWSLs3viMN5bekKIemopsIDhqZ7R/bzCGtXXTOKiu7+cOhe3PfNyClbDw6cfDSyen
 A9Vl5ovJJV4pcJgRHRDPNfSXMpN4s+aiNNpt8tiJQvRUFJfh43pEH3MGefj01Cl06ppg
 bTd+jkGI9v4KConuCsYBwiK2eKrRjuZC6fp8kNQOjwEzxK/XRjhn/8xtmsy0INqePsFd
 OXXQ==
X-Gm-Message-State: AOJu0Yz0WwFSjkzc+03Q8bkLQ3026u32cDQ8aKcusHYvtOSvXcUO4ocV
 iqUgcss/fH8H7TSROdLborY=
X-Google-Smtp-Source: AGHT+IE1qW2PmxwR5LLvX3JkKUeu9J9/6IFecg5/0CNK/lN7Qlx51PGBrMaoetarR8ExXxA+mGJZZg==
X-Received: by 2002:a05:600c:2493:b0:40c:a11:19e2 with SMTP id
 19-20020a05600c249300b0040c0a1119e2mr515749wms.114.1703248226392; 
 Fri, 22 Dec 2023 04:30:26 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b0040d3f4b1c8esm5292849wmq.36.2023.12.22.04.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:30:26 -0800 (PST)
Date: Fri, 22 Dec 2023 14:30:23 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Household Cang <canghousehold@aol.com>
Message-ID: <20231222123023.voxoxfcckxsz2vce@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <0351C5C2-FEE2-4AED-84C8-9DCACCE4ED0A@aol.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0351C5C2-FEE2-4AED-84C8-9DCACCE4ED0A@aol.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

SGkgTHVjYXMsCgpPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAwMjo0MDozNEFNIC0wNTAwLCBIb3Vz
ZWhvbGQgQ2FuZyB3cm90ZToKPiA+IE9uIERlYyAxOCwgMjAyMywgYXQgMTE6MjMgQU0sIFJvbWFp
biBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IFRo
aXMgaXMgYSBidWdmaXggZm9yIGFuIGlzc3VlIHRoYXQgd2FzIHJlY2VudGx5IGJyb3VnaHQgdXAg
aW4gdHdvCj4gPiByZXBvcnRzOgo+ID4gCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRk
ZXYvYzU3MjgzZWQtNmI5Yi1iMGU2LWVlMTItNTY1NWMxYzU0NDk1QGJvb3RsaW4uY29tLwo+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2L2U1YzZjNzVmLTJkZmEtNGU1MC1hMWZiLTZi
ZjRjZGI2MTdjMkBlbGVjdHJvbWFnLmNvbS5hdS8KPiA+IAo+IEFkZCBtZSBpbiB0byBiZSB0aGUg
M3JkIHJlcG9ydC4uLgo+IFJLMzU2OCBHTUFDMCAoZXRoMSkgdG8gTVQ3NTMxQkUgKENQVSBwb3J0
KQo+IEN1cnJlbnQgd29ya2Fyb3VuZCBmb3IgbWUgaXMgZXRodG9vbCAtSyBldGgxIHJ4IG9mZiB0
eCBvZmYKCklzICJyeCBvZmYiIGFjdHVhbGx5IHJlcXVpcmVkLCBvciBqdXN0ICJ0eCBvZmYiPwoK
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvbTNjbGZ0Mms3dW1qdG55NTQ2b3QzYXll
YmF0dGtzaWJ0eTN5eXR0cGZmdmRpeGw2NXBAN2RwcXNyNW5pc2JrL1QvI3QKPiAKPiBRdWVzdGlv
biBvbiB0aGUgcGF0Y2ggdG8gYmUgYnVpbHQ6IGhvdyB3b3VsZCBJIGtub3cgaWYgbXkgc2V0dXAg
Y291bGQKPiB0YWtlIGFkdmFudGFnZSBvZiB0aGUgSFcgY2hlY2tzdW0gb2ZmbG9hZD8gUkszNjU4
4oCZcyBldGgwIG9uIHN0bW1hYyBpcwo+IGRvaW5nIGZpbmUsIGFuZCBldGgwIGlzIG5vdCBvbiBh
IERTQSBzd2l0Y2guIERvZXMgdGhpcyBtZWFuIGV0aDEKPiBzaG91bGQgYmUgYWJsZSB0byBkbyBo
dyBjaGVja3N1bSBvZmZsb2FkIG9uY2UgdGhlIHN0bW1hYyBkcml2ZXIgaXMKPiBmaXhlZD8KClRo
ZSBNVDc1MzFCRSBzd2l0Y2ggcmVxdWlyZXMgdHJhbnNtaXR0ZWQgcGFja2V0cyB0byBoYXZlIGFu
IGFkZGl0aW9uYWwKaGVhZGVyIHdoaWNoIGluZGljYXRlcyB3aGF0IHN3aXRjaCBwb3J0IGlzIHRh
cmdldGVkLiBTbyB0aGUgcGFja2V0CnN0cnVjdHVyZSBpcyBub3QgdGhlIHNhbWUgYXMgd2hhdCBl
dGgwIHRyYW5zbWl0cy4KCllvdXIgR01BQyBkYXRhc2hlZXQgc2hvdWxkIGV4cGxhaW4gd2hhdCBw
YWNrZXRzIGl0IGlzIGFibGUgdG8gb2ZmbG9hZApMNCBjaGVja3N1bW1pbmcgZm9yLCBxdWl0ZSBw
bGFpbmx5LiBQcm9iYWJseSBNQUMgKyBJUCArIFRDUCB5ZXMsIGJ1dApNQUMgKyBNVEsgRFNBICsg
SVAgKyBUQ1Agbm8uCgpUaGUgYnVnIGlzIHRoYXQgdGhlIG5ldHdvcmsgc3RhY2sgdGhpbmtzIHRo
YXQgdGhlIEdNQUMgaXMgYWJsZSB0bwpvZmZsb2FkIFRYIGNoZWNrc3VtcyBmb3IgdGhlc2UgTVRL
IERTQSB0YWdnZWQgcGFja2V0cywgc28gaXQgZG9lcyBub3QKY2FsY3VsYXRlIHRoZSBjaGVja3N1
bSBpbiBzb2Z0d2FyZSwgbGVhdmluZyB0aGUgdGFzayB1cCB0byB0aGUgaGFyZHdhcmUuCk15IGd1
ZXNzIGlzIHRoYXQgdGhlIGhhcmR3YXJlIGRvZXNuJ3QgcmVjb2duaXplIHRoZSBwYWNrZXRzIGFz
IHNvbWV0aGluZwp0aGF0IGlzIG9mZmxvYWRhYmxlLCBzbyBpdCBkb2Vzbid0IGNhbGN1bGF0ZSB0
aGUgY2hlY2tzdW0gZWl0aGVyLCBhbmQKdGhhdCdzIHRoZSBzdG9yeSBvZiBob3cgeW91IGVuZCB1
cCB3aXRoIHBhY2tldHMgd2l0aCBiYWQgY2hlY2tzdW1zLgoKVGhlIHBhdGNoIHRvIGJlIGJ1aWx0
IHNob3VsZCBhbmFseXplIHRoZSBwYWNrZXQgYmVmb3JlIHBhc3NpbmcgaXQgdG8gYQpoYXJkd2Fy
ZSBvZmZsb2FkIGVuZ2luZSB3aGljaCB3aWxsIGRvIG5vdGhpbmcuIFRoZSBkcml2ZXIgc3RpbGwg
ZGVjbGFyZXMKdGhlIE5FVElGX0ZfSVBfQ1NVTSB8IE5FVElGX0ZfSVBWNl9DU1VNIGZlYXR1cmVz
IGJlY2F1c2UgaXQgaXMgYWJsZSB0bwpvZmZsb2FkIGNoZWNrc3VtbWluZyBmb3IgX3NvbWVfIHBh
Y2tldHMsIGJ1dCBpdCBmYWxscyBiYWNrIHRvIHRoZQpzb2Z0d2FyZSBjaGVja3N1bSBoZWxwZXIg
Zm9yIHRoZSByZXN0LiBUaGlzIGluY2x1ZGVzIHlvdXIgTVRLIERTQSB0YWdnZWQKcGFja2V0cy4g
VGhleSBjYW4gYmUgY2hlY2tzdW1tZWQgaW4gc29mdHdhcmUgZXZlbiB3aXRoIHRoZSBEU0EgdGFn
IGFkZGVkLApiZWNhdXNlIHRoYXQgdXNlcyB0aGUgbW9yZSBnZW5lcmljIG1lY2hhbmlzbSB3aXRo
IHNrYi0+Y3N1bV9zdGFydCBhbmQKc2tiLT5jc3VtX29mZnNldCwgd2hpY2ggRFNBIGlzIGNvbXBh
dGlibGUgd2l0aCwganVzdCBmaW5lLiBUaGUgR01BQwpkcml2ZXIsIG1vc3QgbGlrZWx5IGJlY2F1
c2Ugb2YgdGhlIGxhY2sgb2YgaGFyZHdhcmUgc3VwcG9ydCwgZG9lcyBub3QKbG9vayBhdCBza2It
PmNzdW1fc3RhcnQgYW5kIHNrYi0+Y3N1bV9vZmZzZXQgKGFrYSBpdCBkb2VzIG5vdCBkZWNsYXJl
CnRoZSBORVRJRl9GX0hXX0NTVU0gZmVhdHVyZSksIHNvIGl0IGNhbm5vdCBvZmZsb2FkIGNoZWNr
c3VtbWluZyBmb3IgeW91cgpzd2l0Y2ggdHJhZmZpYyB1bmxlc3MgdGhhdCB3YXMgc3BlY2lmaWNh
bGx5IGJha2VkIGludG8gdGhlIFJUTC4KCk1vcmUgZGV0YWlscyBpbiB0aGUgIlN3aXRjaCB0YWdn
aW5nIHByb3RvY29scyIgc2VjdGlvbiBvZgpEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZHNhL2Rz
YS5yc3QuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
