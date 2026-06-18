Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TFZPD4TvM2opJQYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 15:15:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A26A0646
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 15:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=RvDj8lXa;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF2FC8F292;
	Thu, 18 Jun 2026 13:15:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A95A2C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 13:15:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 59B64444D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA691F0155B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781788544;
 bh=FAAn/mWJuuN5gL4FlLtNSl6vPNBasbbg1AXB8rDwhzk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=RvDj8lXapXNOvDW2rf9wVnNlwHPrTLK4sqXVu5/UvcJCFMrFeluBRbB7SYTQM7zqe
 5j3fADVyCzPW/FMNcXuGyIJkNXAG2eY10J+sPgFludxHZhQliRr+xytCmBOmIqI6rM
 iP9qCUbW3Ss9yE+rTytVTiMA+bZXsdkNCjy5RuuotGpr2ErLHf6ktGcAr8fWt7G2hv
 lC6t4g9zYopVfoicscD/Sjs4NJmrkTL0RJF7ejLsBWhgOc6va+W3+fwcZyVeUFoMYY
 prrIDR80FHzeKc4CM6LUoP7IozLBBYb8Ap5PSDKu2EPiQhuFVVPS/ZL1YEL7Z3LhUC
 i1SfWrn9Y2F8Q==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-39677aed4d3so8301561fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 06:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/kvr4G/mSU/wqIRv1P2XKtl0YVuRbZ1Jklkp86yEcOS59Clufm9dKDumF/GM/2rr2XjRxfzPxjnv+Jyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6QAB6gSxmf1pcH43EopE+cYgjsDgzQ5cpWGEp4BvkH9Ewil0C
 VMdnMwIIKJeLcpoScT20IFAkQ7y3quqaAnQTUFmTStvVdBW1spdoV3wx7L7v9FYQ5A7tU0hgu9w
 NYJY5xYm+B+uLQRmchD1lYGi9ueOTv2M=
X-Received: by 2002:ac2:4f0f:0:b0:5ad:51ac:21d8 with SMTP id
 2adb3069b0e04-5ad51ac22a4mr687097e87.14.1781788542680; Thu, 18 Jun 2026
 06:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:15:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
X-Gm-Features: AVVi8Cd4ajb_jyilwrzYqFD2Tx2XDqLDSoVk9kbdtiibfu6CS572v2FjQevMhk4
Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, jianhao.xu@seu.edu.cn,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:alexandre.belloni@bootlin.com,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linus.walleij@linaro.org,m:samuel@sholland.org,m:claudiu.beznea@tuxon.dev,m:jernej.skrabec@gmail.com,m:nicolas.ferre@microchip.com,m:linux-gpio@vger.kernel.org,m:ludovic.desroches@microchip.com,m:jianhao.xu@seu.edu.cn,m:wens@csie.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,kernel.org,vger.kernel.org,linaro.org,sholland.org,tuxon.dev,microchip.com,seu.edu.cn,csie.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,seu.edu.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB9A26A0646

SGkgUnVueXUsCgp0aGFua3MgZm9yIHlvdXIgYW5hbHlzaXMhCgpPbiBUaHUsIEp1biAxOCwgMjAy
NiBhdCA3OjQy4oCvQU0gUnVueXUgWGlhbyA8cnVueXUueGlhb0BzZXUuZWR1LmNuPiB3cm90ZToK
Cj4gVGhlIHBhdGggd2UgYXJlIGNvbmNlcm5lZCBhYm91dCBpczoKPgo+ICAgZ3Bpb2Rfc2V0X2Nv
bmZpZygpCj4gICAgIC0+IGdwaW9fZG9fc2V0X2NvbmZpZygpCj4gICAgICAgIC0+IGdwaW9jaGlw
X2dlbmVyaWNfY29uZmlnKCkKPiAgICAgICAgLT4gcGluY3RybF9ncGlvX3NldF9jb25maWcoKQo+
ICAgICAgICAtPiBwaW5jdHJsX2dldF9kZXZpY2VfZ3Bpb19yYW5nZSgpCj4gICAgICAgIC0+IG11
dGV4X2xvY2soJnBjdGxkZXYtPm11dGV4KQoKVGhhdCB3b3VsZCBiZSBtdXRleF9sb2NrKCZwaW5j
dHJsZGV2X2xpc3RfbXV0ZXgpOyB3b3VsZCBpdCBub3Q/Cgo+IElmIGdwaW9kX2NhbnNsZWVwKCkg
cmV0dXJucyBmYWxzZSwgYSBHUElPIGZvcndhcmRlciBvciBhbm90aGVyIGNvbnN1bWVyCj4gY2Fu
IGNob29zZSBhbiBhdG9taWMgY2FycmllciBhbmQgY2FsbCBncGlvZF9zZXRfY29uZmlnKCkgd2hp
bGUgaG9sZGluZyBhCj4gc3BpbmxvY2suCgpJIHNlZSB0aGUgcHJvYmxlbS4KCj4gVGhlIGxvY2Fs
IGRyYWZ0IEkgYW0gY29uc2lkZXJpbmcgbWFya3Mgb25seSB0aGVzZSBjb250cm9sbGVycyBhcwo+
IHNsZWVwaW5nOgo+Cj4gICBwaW5jdHJsOiBhdDkxLXBpbzQ6IG1hcmsgdGhlIEdQSU8gY29udHJv
bGxlciBhcyBzbGVlcGluZwo+ICAgcGluY3RybDogc3RtMzI6IG1hcmsgdGhlIEdQSU8gY29udHJv
bGxlciBhcyBzbGVlcGluZwo+ICAgcGluY3RybDogc3VueGk6IG1hcmsgdGhlIEdQSU8gY29udHJv
bGxlciBhcyBzbGVlcGluZwo+Cj4gVGhlIHJlYXNvbiBpcyB0aGF0IGFsbCB0aHJlZSBleHBvc2Ug
Z3Bpb2NoaXBfZ2VuZXJpY19jb25maWcoKSBhbmQgY2FuCj4gdGhlcmVmb3JlIHJlYWNoIHRoZSBw
aW5jdHJsIG11dGV4IGZyb20gdGhlIEdQSU8gc2V0X2NvbmZpZyBwYXRoLCB3aGlsZQo+IHRoZWly
IGN1cnJlbnQgZ3Bpb19jaGlwIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCBzZXQgY2FuX3NsZWVwLgoK
QnV0IHRoYXQncyBub3QgdGhlIHJpZ2h0IHNvbHV0aW9uIGlzIGl0PyBUaGVzZSBjb250cm9sbGVy
cyBjYW4gcHJvYmFibHkKanVzdCB3cml0ZSBhIHJlZ2lzdGVyIGFuZCBiZSBkb25lIHdpdGggaXQs
IHRoZXkgYWxsIGxvb2sgbGlrZSB0aGV5IGFyZQptZW1vcnktbWFwcGVkPyBUaGF0IG1lYW5zIHdl
IGludHJvZHVjZSBzbGVlcCB3aGVyZSBub3QgbmVlZGVkLgoKQ2FuIHdlIHNpbXBseSByZXBsYWNl
IHBpbmN0cmxkZXZfbGlzdF9tdXRleCB3aXRoIGEgc3BpbmxvY2s/ClRoZSBsaXN0IGlzbid0IGdv
bm5hIGJlIGh1Z2UgYW5kIGFsbCBpbi1tZW1vcnkgYW55d2F5LgpJZiBpdCB0YWtlcyB0b28gbXVj
aCB0aW1lIHdlIG5lZWQgdG8gdGhpbmsgYWJvdXQgcHV0dGluZyB0aGUKcmFuZ2VzIGluIGEgYmV0
dGVyIGRhdGEgc3RydWN0dXJlIHN1Y2ggYXMgdGhlIG1hcGxlIHRyZWUuCgptdXRleF9sb2NrKCZw
aW5jdHJsZGV2X2xpc3RfbXV0ZXgpOyBjb3VsZCB0aGVuIGJlIHR1cm5lZAppbnRvIHNwaW5sb2Nr
X2lycXNhdmUoKSBvciBldmVuIGJldHRlcgpndWFyZChzcGlubG9ja19pcnFzYXZlKSgmcGluY3Ry
bGRldl9saXN0X2xvY2spIGluCnBpbmN0cmxfZ2V0X2RldmljZV9ncGlvX3JhbmdlKCkuCgpUaGlz
IHdvdWxkIG1lYW4gd2UganVzdCB0YWtlIHR3byBkaWZmZXJlbnQgc3BpbmxvY2tzIGluIHNlcWVu
Y2UKYW5kIHNhdmUgc3RhdGUgaW4gZWFjaCBzbyBpdCBzaG91bGQgd29yayBqdXN0IGZpbmUuCgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
