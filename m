Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9B6AFF56
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3726FC6B476;
	Wed,  8 Mar 2023 07:00:29 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B7DDC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 22:20:12 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id e194so9783135ybf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 14:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678141211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
 b=WQLXFgm2cskHChBbeJjnWfHzLaVEexVQKOQ4rB9cRG3lQA3qPXuomhUFMa1bPJaV+O
 elX+AVtcktbnW0u6KZFFrMz/uVu6DNtCdgp7AOhijqFyjyBI6havk1pXij2OauQZ92qg
 TP7BYf+epbi5+Fb8EdRlsu8DoxuCo/2SVjKw2HJW8WDIUgzdaxomEvmi9CQMcj+Gtg/u
 AWdSzRJdlgO45NCMRtVrCRZOSi4bGROwqVtYX+0cJKot3gy/M2pkyUPeu9oLPYu3Bo7A
 haB/pNnDt3IxCUNKe7BAbGoTTF32+chnWsq932lhwVWXjK9AljFmPq2wHMNt9iZXwgl3
 6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
 b=q7GXquqhh0pH/mgVpBCe97dhgXfThetVWLNiaaPSFGvk4OOYyZr/jcB9gYn7/r87SP
 JhRs9rOBfmn4nbjDA2raUPFaMi6Z40TnnolE7ih5n4Rp5e3yCK5Yv9xHSt5ds+rKknKd
 POfP8Fh+/pBPzG8+JTAF+8OVKyqRn/KmXKBElLeei/ZukLsib63fPJM2QSJKMGSzRROv
 hneUJnI+iQ2Y2BFspOyVYQcBE7b/Gjd9lSuidcNl+HqGXKV7ml1tx91Hb7jKvtH2sMw1
 eAzlANiIg6L8YYiVcHpw0c5ynzHbWOK2ksGvLna5jPONRnhrzRIx50Zt2L210DPHjrKf
 wayw==
X-Gm-Message-State: AO0yUKXMFRGQ0gx+drqWqAjcPHYmJ8luzmmy4zj8/2J1uye8Si8EEd1M
 Le+W/2XB00oS8FLcbgAzvMaOta25H/SAEdXO/Q9jCA==
X-Google-Smtp-Source: AK7set+xwxOTuAGUH2F4JBk51moW8y8vFCxjzdcMEe6q9xVEyLeKbxDfeAXuirvD55r2Rwjk4zMOQZkWM/2/groUae8=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr7198831ybs.5.1678141211227; Mon, 06 Mar
 2023 14:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:59 +0100
Message-ID: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 anitha.chrisanthus@intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, airlied@gmail.com, javierm@redhat.com,
 jernej.skrabec@gmail.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev,
 p.zabel@pengutronix.de, daniel@ffwll.ch, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, andrew@aj.id.au, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 00/22] drm/dma-helper: Add dedicated fbdev
	emulation
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA0OjMx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiBBZGQgZmJkZXYgZW11bGF0aW9uIHRoYXQgaXMgb3B0
aW1pemVkIGZvciBETUEgaGVscGVycywgYXMgdXNlZCBieSBtb3N0Cj4gZHJpdmVycy4gSXQgb3Bl
cmF0ZXMgZGlyZWN0bHkgb24gR0VNIERNQSBidWZmZXJzIGluIHN5c3RlbSBtZW1vcnkuCj4gTWVt
b3J5IHBhZ2VzIGFyZSBtbWFwJ2VkIGRpcmVjdGx5IHRvIHVzZXJzcGFjZS4gTm8gaW1wbGljaXQg
c2hhZG93Cj4gYnVmZmVycyBuZWVkIHRvIGJlIGFsbG9jYXRlZDsgYXMgY2FuIGhhcHBlbiB3aXRo
IHRoZSBnZW5lcmljIGZiZGV2Cj4gZW11bGF0aW9uLiBDb252ZXJ0IGRyaXZlcnMgdGhhdCBmdWxm
aWwgdGhlIHJlcXVpcmVtZW50cy4KPgo+IFRlc3RlZCB3aXRoIGZiY29uIGFuZCBJR1Qgb24gdmM0
Lgo+Cj4gRnV0dXJlIGRpcmVjdGlvbjogcHJvdmlkaW5nIGEgZGVkaWNhdGVkIGZiZGV2IGVtdWxh
dGlvbiBmb3IgR0VNIERNQQo+IGhlbHBlcnMgd2lsbCBhbGxvdyB1cyB0byByZW1vdmUgdGhpcyBj
YXNlIGZyb20gdGhlIGdlbmVyaWMgZmJkZXYgY29kZS4KPiBUaGUgbGF0dGVyIGNhbiB0aGVuIGJl
IHNpbXBsaWZpZWQuCgoxKSBJIGxvdmUgeW91ciB3b3JrLgoKMikgV2h5IGlzbid0IHRoaXMgRFJN
IGRyaXZlciBjaGFuZ2VkPwpkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCkFGQUlDVCBp
dCBhbHNvIHVzZXMgR0VNIGJ1ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeS4KCjMpIFRoaXMgb25lOgpk
cml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmMKaXMgYWxzbyB2ZXJ5IHNpbWlsYXIsIGJ1
dCBjYW4gc29tZXRpbWVzIHVzZSBhIGRlZGljYXRlZApSQU0gbWVtb3J5IGZvciBhbGxvY2F0aW9u
cyB1c2luZyBDTUEsIGRvZXMgdGhhdCBtYWtlCml0IG5vdCBhIGNhbmRpZGF0ZT8KClRoZXkgYXJl
bid0IG11Y2ggZGlmZmVyZW50IGluIGhvdyB0aGV5IHdvcmsgZnJvbSB0aGUgVFZFMjAwLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
