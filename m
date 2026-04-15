Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COuhFZnQ32m4ZAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 19:53:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E931D406ED0
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 19:53:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87403C3F944;
	Wed, 15 Apr 2026 17:53:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 704B2C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 17:53:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so63850425e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 10:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776275607; cv=none;
 d=google.com; s=arc-20240605;
 b=Qs+A13XQZaSR8bOlQRCOpYmKfNTba0qAUSvZ/OL9fFb0uo+giIx7uGLnoQ1suIYoj5
 saZuCr9o8QBJJSre1DWu1wB4Gi8IHsSiZF2Lk9a/8sAirI41JVn8oAIprAqEs3banH/d
 EfPhpMCl0EgkGB4Dsbfe+ghK7ivhs/mg9AeMcxCZBZz3tg/Gw54YInMsIKJ4dSMZq7Do
 t5CGF3JFq/noD/jX75P5pcAobnF/GPy3iekyt3ly3+ZonRUmXQc5Rl/f1Od4h6FVBHU4
 dQc4DBG6wutEiiWkJQX9JB4PmjnHvJ73PYVYdvG5SVBnWFz0AmiF+cVJ1i15KbJNngBk
 4BZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
 fh=GNRcspDpd6aREn3zzXuMQ2aDnL+/QUld4+CTSjfRjvw=;
 b=ZGPi/wDXIy82t2vxxJdwezx+hNGVLjhxWKxPgTny7mNXT9H5ZApLQuCpJLuPiQJno5
 40L1Ms5mxJxirEnblsgk9TdK+ZQ1qtr96kiMhfTyCW3FiAFqjF9teyAg8AMI67IZOzYk
 q+9dJ2Sbb2q36qR1qEJbI7bgkZV+9pOk26ralAeRcMP6Wm50HxoJfm3Rnl6vOaVGJgnm
 VG3AGeprTaNHRu1UArTYyROQGSYsoQg4PH2tj4+Xb6q+7bxWcHmuF15mYP074ty4RB7e
 P5kC4Bu4cJ8oUbWHWJxtPJUUBDQjcNQ2LAU+TzGsF3bxqkCqBeXutbwj7vPkXAGK+fTw
 2Rig==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776275607; x=1776880407;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
 b=Q5zuusp9T5xdtAQ4+o+6KFHOG77K+9UHQduM5gYoK5PfWuUP+0FJOpYfhpRK78rcSL
 oMdkrRNzOWSTiZefSfLKW0twcihOlqKXdUZ/IVku8njQbHZB9BvopFk5zHwAZWQDBYlG
 F9yZTCVZaZYoGVtQ8Bzj14eyR0OY9ny2PJ/bnweXF7MG22VyMGF6dYPGTrWQNGGl+SUq
 hH9tiMDZFAfZxLj/BxR3ITEZpQvHYmMfqLuzdCQZ59OmGRXvou85njXNL+dtjGI6Zb04
 I2F/672Hmam2dq00SOlg9esytoMeGBqlTVa9JlZ6UnyGxjPvsCDF7OIxEOG0hHOzkKv1
 E0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776275607; x=1776880407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
 b=kPcX4k5b2WXFCvrFvSG9zCeknmhP6ODKNLlTpEQCqFTsGUatvOf57WXJh5sBP7vCNI
 iAa8GUGiL+gZEXIBFm34Zek4H82SUsE85v4GSelfip7ZjmehxPMiJ/frE1ckWoAWvAZc
 RuL8UWhUGXSqkMK+RpIhZiidtAM4rFna+CgZdiU/ILcBr5+cdmDiUCF593ZN8fvFenQp
 gFZKNZEbzQBTIycy0yW0VqBKquEBz0Arx8PWkDxZsjNforVX7/Np8bHoI5zfDFCVzr46
 //LvHqvuaULhnFEduch+sKQptTfmOvGB+ADpPlGO4aT8rx+CuvMt++LrtQlLtQj1QT3c
 1Stg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/92sAYjt1uGbzbZuPmGfJx4qljiHfwt1WypLfbfzQuCzbzQzUXYaQINXidrFRgGjGPRR2dH70633+Meg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3B1GbKoSRRk23wbQ3q+n8vpKvudVDJhs738LnuWsZr3f0zqTc
 RBtSGmqR9OiK5R8WTwbqItvcItixDMOsUB7dXYyHbRuc3XvQ3JKeXYsX5zsz8SSmSHn1vEWR2fo
 r8nm/6lToLe3wKmTEIt5TBsHNAxRPiP4=
X-Gm-Gg: AeBDiev6sAueQ5Xmb2FckrA47WIf1zlRDyKdXslEuSl0019STvRpkp75hzrCjWJF38L
 FFKHAAN0MgFuO8t5q03COuZOlat8j+EULdoy2wK4c8EidI2JEDK9uYZIOdOg3r28FEqMZPmuKzI
 g/WIb6P8g5YE5yAsSbHJmNUPBeRlWxVV6xfNmVMeUsTONNRyl2NeIGIH1Z+SMRv+HJ3mjh5jNoB
 PrYC9rXgFEj7CiOv4IK9rhmNf4rw4CvYpzT1XT4YigVtPc64BXXBW0znrPo919Ra1wOzYS8K3wA
 cwcilofDpRfh6kKoelx9Sto+TrmZ8BCwKAvbh0+jcVxPnZBDXqo36kEheF2jag==
X-Received: by 2002:a05:600c:5d4:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-488d6ebe787mr187773555e9.15.1776275606586; Wed, 15 Apr 2026
 10:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260415023947.7627-1-CFSworks@gmail.com>
 <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
 <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
In-Reply-To: <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 10:53:15 -0700
X-Gm-Features: AQROBzDx1d-IgIRVj7cWC6Z49XonSYVLruilzmwd4JOrF6rh0MceXKBVK6meuRA
Message-ID: <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent NULL deref
	when RX memory exhausted
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,bootlin.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E931D406ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgOToyOOKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0
IDAxOjU2OjMyUE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IExvY2Fs
bHksIHdoaWxlIGRlYnVnZ2luZyBteSBpc3N1ZXMsIEkgdXNlZCB0aGlzIHRvIHByZXZlbnQgY3Vy
X3J4Cj4gPiBjYXRjaGluZyB1cCB3aXRoIGRpcnR5X3J4Ogo+ID4KPiA+ICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSBzdG1tYWNfcnhfc3RhdHVzKHByaXYsICZwcml2LT54c3RhdHMsIHApOwo+ID4g
ICAgICAgICAgICAgICAgIC8qIGNoZWNrIGlmIG1hbmFnZWQgYnkgdGhlIERNQSBvdGhlcndpc2Ug
Z28gYWhlYWQgKi8KPiA+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoc3RhdHVzICYgZG1h
X293bikpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiAgICAgICAg
ICAgICAgICAgbmV4dF9lbnRyeSA9IFNUTU1BQ19ORVhUX0VOVFJZKHJ4X3EtPmN1cl9yeCwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+ZG1h
X2NvbmYuZG1hX3J4X3NpemUpOwo+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShuZXh0
X2VudHJ5ID09IHJ4X3EtPmRpcnR5X3J4KSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4KPiA+ICAgICAgICAgICAgICAgICByeF9xLT5jdXJfcnggPSBuZXh0X2VudHJ5Owo+
ID4KPiA+IElmIHdlIGNhcmUgYWJvdXQgdGhlIGNvc3Qgb2YgcmVsb2FkaW5nIHJ4X3EtPmRpcnR5
X3J4IG9uIGV2ZXJ5Cj4gPiBpdGVyYXRpb24sIHRoZW4gSSdkIHN1Z2dlc3QgdGhhdCB0aGUgY29z
dCB3ZSBhbHJlYWR5IGluY3VyIHJlYWRpbmcgYW5kCj4gPiB3cml0aW5nIHJ4X3EtPmN1cl9yeCBp
cyBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkLCBhbmQKPiA+IGVsaW1pbmF0aW5n
IHRoYXQgd291bGQgY291bnRlciB0aGUgY29zdCBvZiByZWFkaW5nIHJ4X3EtPmRpcnR5X3J4LiBJ
Cj4gPiBzdXNwZWN0LCBob3dldmVyLCB0aGF0IHRoZSBjb3N0IGlzIG1pbmltYWwsIGFzIGN1cl90
eCBhbmQgZGlydHlfcnggYXJlCj4gPiBsaWtlbHkgaW4gdGhlIHNhbWUgY2FjaGUgbGluZS4KCk5v
LCBubywgSSBsaWtlIHlvdXIgYXBwcm9hY2ggYmV0dGVyLiA6KSBJdCBhbHNvIHJlbW92ZXMgdGhl
IG5lZWQgZm9yCnRoZSBgbGltaXRgIGNsYW1wIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLCBz
byBsYXRlciBjb2RlIGNhbiBhc3N1bWUKbGltaXQ9PWJ1ZGdldC4KCj4gPiBJdCBsb29rcyBsaWtl
IGFueSBmaXggdG8gc3RtbWFjX3J4KCkgd2lsbCBhbHNvIG5lZWQgYSBjb3JyZXNwb25kaW5nCj4g
PiBmaXggZm9yIHN0bW1hY19yeF96YygpLgoKSSBhZ3JlZSB0aGF0IHN0bW1hY19yeF96YygpIGlz
IGxpa2VseSBhbHNvIGJyb2tlbiAoaW4gYSBzaW1pbGFyIHdheSwKYnV0IG5vdCBzaW1pbGFyIGVu
b3VnaCB0byBwZXJtaXQgYSAiY29ycmVzcG9uZGluZyIgZml4KSwgYnV0IEkgZG9uJ3QKYWdyZWUg
dGhhdCB0aGVyZSdzIGEgZGVwZW5kZW5jeSByZWxhdGlvbnNoaXAgaGVyZS4gVGhpcyBwYXRjaCBp
cwphZGRyZXNzaW5nICMyMjEwMTAsIHdoaWNoIGFmZmVjdHMgdGhlIGdlbmVyaWMvbm9uLVpDIGNv
ZGVwYXRoOyBJJ20KYWZyYWlkIHRoZSBaQyBjb2RlcGF0aCB3YXJyYW50cyBpdHMgb3duIGludmVz
dGlnYXRpb24uCgo+IEkgaGF2ZSBzb21lIGZ1cnRoZXIgaW5mb3JtYXRpb24sIGJ1dCBhIG5ldyBj
dXJ2ZWJhbGwgaGFzIGp1c3QgYmVlbgo+IGNodWNrZWQuLi4gYW5kIEkndmUgbm8gaWRlYSB3aGF0
IHRoaXMgd2lsbCBtZWFuIGF0IHRoaXMgc3RhZ2UuIEp1c3QKPiB0YWtlIGl0IHRoYXQgSSB3b24n
dCBiZSByZXNwb25kaW5nIGZvciBhIHdoaWxlLgoKSSB0aGluayBJIGZvbGxvdyB5b3VyIG1lYW5p
bmcuIEdvb2QgbHVjayBnZXR0aW5nIGl0IHN0cmFpZ2h0ZW5lZCBvdXQhCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
