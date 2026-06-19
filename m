Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frnzCIAFNWp5mAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 11:01:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D46A4D03
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 11:01:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=cFZb9JqS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC17BC9AE4F;
	Fri, 19 Jun 2026 09:01:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 867C7C8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 09:01:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 78F62601EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D66A1F00ACF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781859708;
 bh=Y5VtAymxlLFEtb0U6jcGmlhzLhg//OIMtC8T2ioCYrc=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc;
 b=cFZb9JqSPtnh8VwXU7oKlMKiSPgRJmzZnIAd1QeGARdtrTOXzyFwBw8CQeMAKb/mO
 IlRLx9yBLuddW8AgBZ1+jHzpLszyAp1IVF1qhFE4LghsaJ+Uj1VwzjXYaJNo+kh5Zf
 KwrUJc13uiSw19BaVUia2ZfmmJuSAPBeVHmrqPfuFI9XfZOBYbheQpi2tVFzNLz4Lm
 3nukAGpY4S488Gaxjjcq4nYc8JVlj/PtPvSsjP6HJ87/p13zr8/xTgBkJnj1W3dO0x
 Ub60SWVqtpNCO9W+l2i1MpAFEXa6NrSPAEwIwxIY8buLyQHmPvhtl/EzH803l9LtcT
 XzezWFVGTNrnQ==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5ad583dc38eso567854e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 02:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ89eLfJs6RQAPyRbMSrBQaFEAmEigcbBxp1pEnqM+mIUDbr20IVhuJdqimxwUNaxz7K2kXN4AJMgVL13Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjgTGQSWInPs8dXqZHa0tW0EeODeiLmdGggMbmvAr3gV3+9Udh
 Av9PKlnrXhaE0Pw5wQ2EASo/KOLqgddAItawHGipmx4TpxKINpYKWZSCrxrAZjEEy4/f41v7Bc5
 NfgyQ0TPnVon/RBAc4jFVF+JNOJDsh4Aqfd2X8PDnRQ==
X-Received: by 2002:a05:6512:32cd:b0:5ad:5454:ce36 with SMTP id
 2adb3069b0e04-5ad576e14f5mr699548e87.14.1781859706741; Fri, 19 Jun 2026
 02:01:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
 <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Date: Fri, 19 Jun 2026 04:01:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
X-Gm-Features: AVVi8Cf8K9ux4cOtecot2S0VT6T3CGese0FIUj-6Z9fRYnLoXRYWJS40QkJmni8
Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, jianhao.xu@seu.edu.cn,
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Question: pinctrl-backed GPIO set_config and
	gpio_chip::can_sleep
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linus.walleij@linaro.org,m:samuel@sholland.org,m:claudiu.beznea@tuxon.dev,m:jernej.skrabec@gmail.com,m:nicolas.ferre@microchip.com,m:linux-gpio@vger.kernel.org,m:ludovic.desroches@microchip.com,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:wens@csie.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,kernel.org,vger.kernel.org,linaro.org,sholland.org,tuxon.dev,microchip.com,seu.edu.cn,csie.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,seu.edu.cn:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 610D46A4D03

T24gVGh1LCAxOCBKdW4gMjAyNiAxNToxNTozMCArMDIwMCwgTGludXMgV2FsbGVpaiA8bGludXN3
QGtlcm5lbC5vcmc+IHNhaWQ6Cj4gSGkgUnVueXUsCj4KPiB0aGFua3MgZm9yIHlvdXIgYW5hbHlz
aXMhCj4KPiBPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCA3OjQy4oCvQU0gUnVueXUgWGlhbyA8cnVu
eXUueGlhb0BzZXUuZWR1LmNuPiB3cm90ZToKPgo+PiBUaGUgcGF0aCB3ZSBhcmUgY29uY2VybmVk
IGFib3V0IGlzOgo+Pgo+PiAgIGdwaW9kX3NldF9jb25maWcoKQo+PiAgICAgLT4gZ3Bpb19kb19z
ZXRfY29uZmlnKCkKPj4gICAgICAgIC0+IGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnKCkKPj4gICAg
ICAgIC0+IHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnKCkKPj4gICAgICAgIC0+IHBpbmN0cmxfZ2V0
X2RldmljZV9ncGlvX3JhbmdlKCkKPj4gICAgICAgIC0+IG11dGV4X2xvY2soJnBjdGxkZXYtPm11
dGV4KQo+Cj4gVGhhdCB3b3VsZCBiZSBtdXRleF9sb2NrKCZwaW5jdHJsZGV2X2xpc3RfbXV0ZXgp
OyB3b3VsZCBpdCBub3Q/Cj4KPj4gSWYgZ3Bpb2RfY2Fuc2xlZXAoKSByZXR1cm5zIGZhbHNlLCBh
IEdQSU8gZm9yd2FyZGVyIG9yIGFub3RoZXIgY29uc3VtZXIKPj4gY2FuIGNob29zZSBhbiBhdG9t
aWMgY2FycmllciBhbmQgY2FsbCBncGlvZF9zZXRfY29uZmlnKCkgd2hpbGUgaG9sZGluZyBhCj4+
IHNwaW5sb2NrLgo+Cj4gSSBzZWUgdGhlIHByb2JsZW0uCj4KPj4gVGhlIGxvY2FsIGRyYWZ0IEkg
YW0gY29uc2lkZXJpbmcgbWFya3Mgb25seSB0aGVzZSBjb250cm9sbGVycyBhcwo+PiBzbGVlcGlu
ZzoKPj4KPj4gICBwaW5jdHJsOiBhdDkxLXBpbzQ6IG1hcmsgdGhlIEdQSU8gY29udHJvbGxlciBh
cyBzbGVlcGluZwo+PiAgIHBpbmN0cmw6IHN0bTMyOiBtYXJrIHRoZSBHUElPIGNvbnRyb2xsZXIg
YXMgc2xlZXBpbmcKPj4gICBwaW5jdHJsOiBzdW54aTogbWFyayB0aGUgR1BJTyBjb250cm9sbGVy
IGFzIHNsZWVwaW5nCj4+Cj4+IFRoZSByZWFzb24gaXMgdGhhdCBhbGwgdGhyZWUgZXhwb3NlIGdw
aW9jaGlwX2dlbmVyaWNfY29uZmlnKCkgYW5kIGNhbgo+PiB0aGVyZWZvcmUgcmVhY2ggdGhlIHBp
bmN0cmwgbXV0ZXggZnJvbSB0aGUgR1BJTyBzZXRfY29uZmlnIHBhdGgsIHdoaWxlCj4+IHRoZWly
IGN1cnJlbnQgZ3Bpb19jaGlwIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCBzZXQgY2FuX3NsZWVwLgo+
Cj4gQnV0IHRoYXQncyBub3QgdGhlIHJpZ2h0IHNvbHV0aW9uIGlzIGl0PyBUaGVzZSBjb250cm9s
bGVycyBjYW4gcHJvYmFibHkKPiBqdXN0IHdyaXRlIGEgcmVnaXN0ZXIgYW5kIGJlIGRvbmUgd2l0
aCBpdCwgdGhleSBhbGwgbG9vayBsaWtlIHRoZXkgYXJlCj4gbWVtb3J5LW1hcHBlZD8gVGhhdCBt
ZWFucyB3ZSBpbnRyb2R1Y2Ugc2xlZXAgd2hlcmUgbm90IG5lZWRlZC4KPgo+IENhbiB3ZSBzaW1w
bHkgcmVwbGFjZSBwaW5jdHJsZGV2X2xpc3RfbXV0ZXggd2l0aCBhIHNwaW5sb2NrPwoKT2ggSSd2
ZSB0cmllZCwgSSd2ZSBnaXZlIGl0IGEgZmV3IGF0dGVtcHRzIGluIHRoZSBwYXN0LiBJdCdzIG5v
dCBhICJzaW1wbHkiCmNhc2UgdGhpcyBvbmUhIDopCgo+IFRoZSBsaXN0IGlzbid0IGdvbm5hIGJl
IGh1Z2UgYW5kIGFsbCBpbi1tZW1vcnkgYW55d2F5Lgo+IElmIGl0IHRha2VzIHRvbyBtdWNoIHRp
bWUgd2UgbmVlZCB0byB0aGluayBhYm91dCBwdXR0aW5nIHRoZQo+IHJhbmdlcyBpbiBhIGJldHRl
ciBkYXRhIHN0cnVjdHVyZSBzdWNoIGFzIHRoZSBtYXBsZSB0cmVlLgo+CgpGV0lXIHJhZGl4IHRy
ZWUgcHJvdmlkZXMgc29tZSBSQ1Ugc3luY2hyb25pemF0aW9uIElJUkMuCgo+IG11dGV4X2xvY2so
JnBpbmN0cmxkZXZfbGlzdF9tdXRleCk7IGNvdWxkIHRoZW4gYmUgdHVybmVkCj4gaW50byBzcGlu
bG9ja19pcnFzYXZlKCkgb3IgZXZlbiBiZXR0ZXIKPiBndWFyZChzcGlubG9ja19pcnFzYXZlKSgm
cGluY3RybGRldl9saXN0X2xvY2spIGluCj4gcGluY3RybF9nZXRfZGV2aWNlX2dwaW9fcmFuZ2Uo
KS4KPgoKSSByZWNhbGwgcnVubmluZyBpbnRvIHBsYWNlcyB3aGVyZSBhIG11dGV4IHdvdWxkIGJl
IHRha2VuIGluIGF0b21pYyBjb250ZXh0CmluIHRoYXQgY2FzZS4KCkJhcnQKCj4gVGhpcyB3b3Vs
ZCBtZWFuIHdlIGp1c3QgdGFrZSB0d28gZGlmZmVyZW50IHNwaW5sb2NrcyBpbiBzZXFlbmNlCj4g
YW5kIHNhdmUgc3RhdGUgaW4gZWFjaCBzbyBpdCBzaG91bGQgd29yayBqdXN0IGZpbmUuCj4KPiBZ
b3VycywKPiBMaW51cyBXYWxsZWlqCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
