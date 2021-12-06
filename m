Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAD4698B2
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 15:23:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D178DC5F1E5;
	Mon,  6 Dec 2021 14:23:41 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4CFCC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 14:23:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D87C212C5;
 Mon,  6 Dec 2021 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638800619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IrA03xuvj5eZKlIPpBlqD1YRCJ4f68IN5DTrfD0Ats0=;
 b=WtzU0zlen7O6OKnHbMT0XwF4NRnWjbkHHAjitMfPAGmf9PXX/2dcabK+lgA1mUDkGpeKRE
 sQnvA4qCSLRj0SGyb02a2Xxf5spn1cGAbikvTxCzPK8LC9qZT7pQiHqgAdpwabmV+1DLHf
 rYV+W3LdONL9X4+I7pOBNtObCdsP8k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638800619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IrA03xuvj5eZKlIPpBlqD1YRCJ4f68IN5DTrfD0Ats0=;
 b=GUoQhCxHx4VbILrKF/vjjCtCqWDrMMhDTdxBnPYWjX0cG+kkSepiycalDfx/nAPW+y/gQ6
 EgKTSbTmD116fvCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EB3D13C32;
 Mon,  6 Dec 2021 14:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOCWAuscrmHXOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 14:23:39 +0000
Message-ID: <10c5672d-a228-ed9e-2f32-1ce9ae86dbcc@suse.de>
Date: Mon, 6 Dec 2021 15:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206134735.13537-1-yannick.fertre@foss.st.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211206134735.13537-1-yannick.fertre@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: remove conflicting framebuffers
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
Content-Type: multipart/mixed; boundary="===============3437027162528376243=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3437027162528376243==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5HB1VTZQOufR3yv5KS39ptL0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5HB1VTZQOufR3yv5KS39ptL0
Content-Type: multipart/mixed; boundary="------------MJaflynH9FQdfRXU3HGqo6l7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <10c5672d-a228-ed9e-2f32-1ce9ae86dbcc@suse.de>
Subject: Re: [PATCH] drm/stm: remove conflicting framebuffers
References: <20211206134735.13537-1-yannick.fertre@foss.st.com>
In-Reply-To: <20211206134735.13537-1-yannick.fertre@foss.st.com>

--------------MJaflynH9FQdfRXU3HGqo6l7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjEgdW0gMTQ6NDcgc2NocmllYiBZYW5uaWNrIEZlcnRyZToNCj4g
SW4gY2FzZSBvZiB1c2luZyBzaW1wbGVmYiBvciBhbm90aGVyIGNvbmZsaWN0aW5nIGZyYW1l
YnVmZmVyLA0KPiBjYWxsIGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCkgdG8g
cmVtb3ZlIG1lbW9yeSBhbGxvY2F0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+DQoNClRoZSBwYXRjaCBzaG91
bGQgaGF2ZSBjb250YWluZWQgYSBub3RlIHRoYXQgdGhpcyBpcyB2ZXJzaW9uIDIgb2YgdGhl
IA0KY2hhbmdlIHdpdGggYSBzaG9ydCBjaGFuZ2Vsb2cuIEFueXdheQ0KDQpSZXZpZXdlZC1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8
IDUgKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHJ2LmMNCj4gaW5kZXggMjIyODY5YjIzMmFlLi45ZjQ0MWFhZGYyZDUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9kcnYuYw0KPiBAQCAtMTQsNiArMTQsNyBAQA0KPiAgICNpbmNsdWRlIDxs
aW51eC9vZl9wbGF0Zm9ybS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
DQo+ICAgDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9hcGVydHVyZS5oPg0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtX2F0b21pYy5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxw
ZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4gQEAgLTE4Myw2ICsxODQs
MTAgQEAgc3RhdGljIGludCBzdG1fZHJtX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICAgDQo+ICAgCURSTV9ERUJVRygiJXNcbiIsIF9fZnVuY19f
KTsNCj4gICANCj4gKwlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhm
YWxzZSwgJmRydl9kcml2ZXIpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+
ICsNCj4gICAJZG1hX3NldF9jb2hlcmVudF9tYXNrKGRldiwgRE1BX0JJVF9NQVNLKDMyKSk7
DQo+ICAgDQo+ICAgCWRkZXYgPSBkcm1fZGV2X2FsbG9jKCZkcnZfZHJpdmVyLCBkZXYpOw0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------MJaflynH9FQdfRXU3HGqo6l7--

--------------5HB1VTZQOufR3yv5KS39ptL0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGuHOoFAwAAAAAACgkQlh/E3EQov+Dc
fhAAu7DYQ55dKkr7yDfEvwSHUUIXfI2AuxIj/wGo4zsRFQAIRM0iBjOFYfm9x5zuROzPgm+Teucd
NkGa4gogckccKaMXUvCQp6P80wnqbUJ1c2ahbLNDd1CmIXicaB/hhdgjpr7YiQHLuOQKkDeGBIP1
Wbh0TyC67hNkqLho7qabdsuFzsLydG6c0Eboepr5ylQr1FSeBZM772XYcZfoMipI8VO2I87MvQja
ofAq8F5711xStcixu8A2BTNfXqTQnvhapnYZr5ExQF/E0UvLKyvXkkyQatoaQc/YZKY0b4AcZk9B
0CA8OOput1zhhHrXvVPFcb9oUGRvBmMixOBCtc/GIgGpn2Dg6mHbDdCqoN1JfgN96cmv+tdg74UE
4z3JcAgdmJl5Nf4LdNksPWFfBxnGf4HUZT5mw678Va4uf/ZDzO/AE2dzW6bumPJqd3VhahQwMlCO
utjryjLM++yP3bE+rat7iKmZ8I8N+yFg8VNwfLTNd1y7ilUW5SPWV+LTxO/NGWBiE+tbSOJ67+3x
szz1oavvGY7qP9e2nfFsQKQuNjoaxt9tG5UHAsjr1Hm+BSAZmM0zhBDCeOtX4F9c3ktpHHk02aZ7
sox4onD8BUZV2/3Y2iTabB4Bj0CdLRCY0CCl9FZzkeKmgXLrFpFDXNbDRkWpCmeq3NqRpkGe5JlM
Z9s=
=6JHv
-----END PGP SIGNATURE-----

--------------5HB1VTZQOufR3yv5KS39ptL0--

--===============3437027162528376243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3437027162528376243==--
