Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F26B1DC7
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 09:22:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40F77C6A60C;
	Thu,  9 Mar 2023 08:22:49 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B989C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 08:17:28 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-536be69eadfso21440857b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678349848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
 b=zHNKNBYRp8ZMtYES6iOOJZdPs+/VrS4r4YOJIdMcn27ttfxXw+5AQLOM553VKzbfnu
 vLHmIOaLbVGba0VsvH1A00WV2qAWWgRg6OCdzr0CGE6bztDfQMn/g9Y5OsP9YhvR9IvQ
 MBPkKaiastTwTZvY+KgDfsVknQjxIsmsmH17UUOwZlFCPeT099gAT1AvqRLyWYGb78VF
 buB27vSGCDqka04+hzRqEy0gBl5mSK5NjjfTzm/G9U23TwZT1xq5DqboEq5enhwfaKIC
 YzzD9CYsGf0djIqiap2rDOQQywTt+nLUZAXM8IkxeeJ6AXIvCT0l3gLpZjJP6pzCZ/ff
 Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678349848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
 b=n4Eq1UsI5gJFq3X4ICtcAE78Zq1b6zhr/PjYSyRAfDUWov11oqK75J/fZmhh1hdhO2
 sTDb1q/Fu/WqLrnIInYv+25Pps7yPbX8kF/ZgZnwPZPO1YKWRxCxyJ7qPSH8cJ9x3pMb
 4cCf6lWnfMrY2v/HVBgGHawGcDlJ0ByIE+RyQbxDJ7iV+yIxVYORlxIC78zTGUZuj7OD
 CKsvea78F+k7Q2VoseE58Su7BwmV2V54SuRmedNGsk+Wb4+0CaNxgMXMBl3H4eEKBugh
 i6bAOLeqViISFBQ27B7qE9bry3e9U3XWzLyCZk4NJt9CMmiGeUWjdgD9eIWrn4fiyDGj
 vNcQ==
X-Gm-Message-State: AO0yUKXhlgUa+GkFYClUoz+LbdJCQ99KPb6kATo8MAIhmEHceuBwC/tq
 auBCR3/W1dEPGEt46H5jGHHeLJS7NmXY2GMmys5wfw==
X-Google-Smtp-Source: AK7set9NqrT7RUuXgHnInuqDO8U0SE1ojud6SJk/FpmB3GQVriAzuG0269C9t+4xeg2JU5VBcDK6EbBkG9E/pM7QunM=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13477522ywa.9.1678349847927; Thu, 09
 Mar 2023 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
 <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
In-Reply-To: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 09:17:16 +0100
Message-ID: <CACRpkdYUVBq_-iZxtoe65eh3ruUOprF_JEG-sZfUSNVhjacVLA@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Thu, 09 Mar 2023 08:22:47 +0000
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCA5OjU14oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IEFtIDA2LjAzLjIzIHVtIDIzOjE5IHNjaHJpZWIgTGlu
dXMgV2FsbGVpajoKCj4gPiAyKSBXaHkgaXNuJ3QgdGhpcyBEUk0gZHJpdmVyIGNoYW5nZWQ/Cj4g
PiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCj4gPiBBRkFJQ1QgaXQgYWxzbyB1c2Vz
IEdFTSBidWZmZXJzIGluIHN5c3RlbSBtZW1vcnkuCj4KPiBUaGlzIGRyaXZlciByZXF1aXJlcyBk
YW1hZ2UgaGFuZGxpbmcKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4yL3Nv
dXJjZS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jI0w5Nwo+Cj4gZm9yIHdoaWNoIHdl
IGhhdmUgdG8gY2FsbCB0aGUgZnJhbWVidWZmZXIncyBkaXJ0eSBjYWxsYmFjawoKT2ggdGhhdCBv
bmUgaXMgb24gbWUgLi4uIEkgbm8gbG9uZ2VyIHJlbWVtYmVyIGV4YWN0bHkgd2h5IEkgdXNlZApk
cm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2RpcnR5KCkgYnV0IEkgdGhpbmsgaXQgd2FzIGJlY2F1c2Ug
SSBoYWQgdGhlCmFtYml0aW9uIHRoYXQgdGhlIGRyaXZlciB3b3VsZCBvbmx5IHNlbmQgb3V0IHVw
ZGF0ZXMgdG8gRFNJIGNvbW1hbmQKZGlzcGxheXMgd2hlbmV2ZXIgc29tZXRoaW5nIGNoYW5nZWQs
IHNvIGFzIHRvIG1pbmltaXplIHRyYWZmaWMuCgpJdCB0dXJucyBvdXQgdGhpcyBhbWJpdGlvbiB3
aXRoIGNvbW1hbmQgbW9kZSBpc24ndCB3b3JraW5nIGluCnByYWN0aWNlIGJlY2F1c2UgYWxsIHRo
ZSBNQ0RFIGRvZXMgaXMgdG8gY3JlYXRlIGEgY29udGludW91cyBzdHJlYW0Kb2YgRFNJIGNvbW1h
bmRzIGFuZCB3aGlsZSBpdCBpcyBwb3NzaWJsZSB0byBzZW5kIHNpbmdsZSBmcmFtZQp1cGRhdGVz
IHdpdGggaXQsIGl0J3Mgbm90IHdvcmtpbmcgaW4gcHJhY3RpY2UuIFNvIHdlIGFyZSBqdXN0IHNl
dHRpbmcKdXAgY29udGludW91cyB1cGRhdGVzLiBXZSB0dXJuIG9mIHRoZSBWQkxBTksgSVJRcyBh
IGJpdCwgYnV0IEkKZ3Vlc3MgdGhlIERSTSBmcmFtZXdvcmsgZG9lcyB0aGF0IGZvciB1cyB3aGVu
IG5vdGhpbmcgZ29lcyBvbi4KCkkgdGVzdGVkIHRvIHJlcGxhY2UgdGhpcyB3aXRoIGRybV9nZW1f
ZmJfY3JlYXRlIGFuZCBpdCB3b3JrcyBqdXN0CmZpbmUuIEknbGwgc2VuZCBvdXQgYSBwYXRjaCBz
byB5b3UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgYWxzbyB0byB0aGUKTUNERSBkcml2ZXIuCgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
