Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EE53FA72
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 11:55:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EA74C5E2CC;
	Tue,  7 Jun 2022 09:55:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE27FC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654595736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7hfgQiB1fvAohjSL+LX1HTZTS0xE+mT9eAbQ5SA/1g=;
 b=N5Htzc//x5WAK9WT6OSB0GWCa0VyCwtp9xQHy2AmF7oYp1zEWHN2cTEJFzqUop4KhaoIHg
 mVEfJTc81LeEzIHzUa47kVDBoTZmDY5hJ16Exs0YB+6VeVglX0EMx2MB47b7VWGgw7H7ZT
 SOO1rEZx6Fu2oGHR9xPZTBQ6LdcGu34=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-apYk3aaXMvWXzGhRfHC_cQ-1; Tue, 07 Jun 2022 05:55:33 -0400
X-MC-Unique: apYk3aaXMvWXzGhRfHC_cQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso12548097wmq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jun 2022 02:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=n7hfgQiB1fvAohjSL+LX1HTZTS0xE+mT9eAbQ5SA/1g=;
 b=uK1EYQH9HPMBYNbYjRiH09IEViB8Zk/BdfNdMuFH/QL4JWfp/pyXU7+hJjpSPorGxC
 XOGfaxkMw94ysJ8uDX/gxQzUgJXACCrq7ZvIb+rDeDhZBm02qrVJ3rqJ2qGw0UjmsNnU
 Mn29L9k1hA3O7l1lg9Vk/fxw+18k+7DTGSkPprUl1x7Rb15CRsZ0Iek2fAhMSi6qLodP
 uWm41oRCRx6ao3aJJ9l+fr7ZhH2lm4MTtFs7j5TTqjL2Ep9miEtUty7vNp3B1obv0bW8
 laNvGIm/7zOsZoehc4Tztngey9vU5mI9wS78VkOHDqfzDvnG+yQvNLkCEqyWUJ/AKRP6
 Fm5A==
X-Gm-Message-State: AOAM531GDbaIhFlilP4SFLCfUXvDh7gy9Q8sguEk1r1C5rmqv5fNEXC4
 ZuDQeNDM5pO/MKuaKh7rpSkO4pvMULcfTCNff5tFOYaYgpTUEs6R5djO1TyPpw1ajts7KE2iBgd
 AGmXQi+avpJ1XWV8LuwMbxKlP4ccDjE0k0NqpuB7H
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr26772065wrf.20.1654595732389; 
 Tue, 07 Jun 2022 02:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmQQjkSNT69Gzr83bM10Ninlkk05aLiBs5DvzsVAimhJHJr7sP1/XRhlCUmbBJ6Rae13u6jQ==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr26772049wrf.20.1654595732186; 
 Tue, 07 Jun 2022 02:55:32 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it.
 [146.241.112.184]) by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b0039c3ecdca66sm12636741wmb.23.2022.06.07.02.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:55:31 -0700 (PDT)
Message-ID: <abbda3f0e47a2b2a3a8304cc0486a7c1304581d9.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wong Vee Khee
 <vee.khee.wong@linux.intel.com>
Date: Tue, 07 Jun 2022 11:55:30 +0200
In-Reply-To: <75b293bd-ec8d-8c90-ffe5-afa49d6a218d@wanadoo.fr>
References: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
 <20220606062650.GA31937@linux.intel.com>
 <75b293bd-ec8d-8c90-ffe5-afa49d6a218d@wanadoo.fr>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: intel: Fix an error handling path
 in intel_eth_pci_probe()
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

T24gTW9uLCAyMDIyLTA2LTA2IGF0IDIyOjQyICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMDYvMDYvMjAyMiDDoCAwODoyNiwgV29uZyBWZWUgS2hlZSBhIMOpY3JpdMKgOgo+
ID4gT24gU3VuLCBKdW4gMDUsIDIwMjIgYXQgMTA6NTA6NDhQTSArMDIwMCwgQ2hyaXN0b3BoZSBK
QUlMTEVUIHdyb3RlOgo+ID4gPiBXaGVuIHRoZSBtYW5hZ2VkIEFQSSBpcyB1c2VkLCB0aGVyZSBp
cyBubyBuZWVkIHRvIGV4cGxpY2l0bHkgY2FsbAo+ID4gPiBwY2lfZnJlZV9pcnFfdmVjdG9ycygp
Lgo+ID4gPiAKPiA+ID4gVGhpcyBsb29rcyB0byBiZSBhIGxlZnQtb3ZlciBmcm9tIHRoZSBjb21t
aXQgaW4gdGhlIEZpeGVzIHRhZy4gT25seSB0aGUKPiA+ID4gLnJlbW92ZSgpIGZ1bmN0aW9uIGhh
ZCBiZWVuIHVwZGF0ZWQuCj4gPiA+IAo+ID4gPiBTbyByZW1vdmUgdGhpcyB1bnVzZWQgZnVuY3Rp
b24gY2FsbCBhbmQgdXBkYXRlIGdvdG8gbGFiZWwgYWNjb3JkaW5nbHkuCj4gPiA+IAo+ID4gPiBG
aXhlczogOGFjY2M0Njc3NThlICgic3RtbWFjOiBpbnRlbDogdXNlIG1hbmFnZWQgUENJIGZ1bmN0
aW9uIG9uIHByb2JlIGFuZCByZXN1bWUiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+ID4gPiAtLS0KPiA+ID4g
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jIHwgNCAr
LS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gPiAKPiA+IAo+ID4gTEdUTQo+ID4gCj4gPiBSZXZpZXdlZC1ieTogV29uZyBWZWUgS2hl
ZSA8dmVlLmtoZWUud29uZ0BsaW51eC5pbnRlbC5jb20+Cj4gPiAKPiA+IAo+IAo+IEhpLAo+IAo+
IEkndmUgbG9va2VkIGF0IGl0IGFnYWluLgo+IAo+IEkgc3RpbGwgdGhpbmsgdGhhdCB0aGUgcGF0
Y2ggaXMgZ29vZCwgYnV0IHBjaW1fcmVsZWFzZSgpIGhhcyBjaGFuZ2VkIGluIAo+IDUuMTggc2lu
Y2UgY29tbWl0IDNmMzVkMmNmOWZiYyAoIlBDSS9NU0k6IERlY291cGxlIE1TSVstWF0gZGlzYWJs
ZSBmcm9tIAo+IHBjaW1fcmVsZWFzZSgpIikKPiAKPiBJIGd1ZXNzIHRoYXQgYWxsIHRoZSBtZWNo
YW5pYyBpcyBpbiBwbGFjZSBzbyB0aGF0IGV2ZXJ5dGhpbmcgaXMgCj4gcmVnaXN0ZXJlZCB3aGVu
IG5lZWRlZCwgYnV0IEkndmUgbm90IGJlZW4gYWJsZSB0byBmaWd1cmUgaXQgb3V0IGluIHRoZSAK
PiBjYXNlIG9mIGR3bWFjLWludGVsLmMuCj4gCj4gU28sIGRvdWJsZSBjaGVjayA6KS4KCkFGQUNJ
UzoKCnN0bW1hY19jb25maWdfe3NpbmdsZSxtdWx0aX1fbXNpIC0+IHBjaV9hbGxvY19pcnFfdmVj
dG9ycyAtPgpwY2lfYWxsb2NfaXJxX3ZlY3RvcnNfYWZmaW5pdHkgLT4gX19wY2lfZW5hYmxlX21z
aXhfcmFuZ2UgLT4KcGNpbV9zZXR1cF9tc2lfcmVsZWFzZQoKU28gTEdUTSwgdGhhbmtzIQoKUGFv
bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
