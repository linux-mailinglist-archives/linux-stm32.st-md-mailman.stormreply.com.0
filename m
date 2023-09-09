Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 130717998DA
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Sep 2023 16:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA89FC6B44D;
	Sat,  9 Sep 2023 14:37:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E361C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Sep 2023 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694270252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
 b=Ekf6PoiE+uQ9x88AYf4zRfx2CZ4HUSwTWAy6jueKhvlxWQvPU07NpxTYR4Pifoul6PvRCp
 GiAFHD4SxPQED2r3f2VACAFcB+86bf3p46XrLo6aSLKhRQyERax0G3I/JqIza5n1VqfHUR
 xKf8tK6fwiquMNSCboljOwNHaPXhXls=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-k9fM-LdEPVePTv-9eSvjuw-1; Sat, 09 Sep 2023 10:37:31 -0400
X-MC-Unique: k9fM-LdEPVePTv-9eSvjuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401c19fc097so23674415e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 Sep 2023 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694270250; x=1694875050;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
 b=qkeWuA9aUMn7egLZZtBBAL/yg70ef59E3GiJS/Ot+WBgtOLOgaHYv//JD2Z/YiZ2Y4
 K4xeuF+yuKsfkbkwA1EBGfk2nPTp0LQ1cFphJc1+wOAfgvosdLR/rUq1coHNEWBpr15q
 UNSUutqKOplVIVNTWPzmH+OXFwrVgqohIGY73K44Qpbz31Ri/RJ4aDPAAmRYqDsjLo26
 wElHRg3q9a5KrScVB3mvWxteD3s1P4mHOBJZF7MrqJw5D/z9h//CuwiPqPR6YW1Girmx
 tsqEAc6OUzXFzRcGoKt+ihEkpv+JhDfVayTIlfjQOUpBhj63tdf6WYc4G7ZO/T5lpoOf
 5fgQ==
X-Gm-Message-State: AOJu0YyPkc2QRm6g8mkNnUcDpgXM+2rKALf9IA5MUWEgXeiixwot+mRX
 REe9dkg6uefkgYrsbePNApOAarrp9uCvPHlpU+AdUNAPB+Kho/Jx3uYhNwpSWalNFdbG5VDqPI8
 gr4EGM/GGJM8BgQDrrwhyQdGjyTZ4Mz00dgaK54X6
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id
 3-20020a05600c248300b00401d2cbe6f3mr5088943wms.1.1694270250173; 
 Sat, 09 Sep 2023 07:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuI0CHTrTRuHu7U+ySuZ17CrBG1YsmWNBf7nwWhsv6ytgzHpvaJlIL3zjF99nLHiP4wc2jkQ==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id
 3-20020a05600c248300b00401d2cbe6f3mr5088899wms.1.1694270249806; 
 Sat, 09 Sep 2023 07:37:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003fd2e898aa3sm3071184wmi.0.2023.09.09.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 07:37:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
Date: Sat, 09 Sep 2023 16:37:28 +0200
Message-ID: <8734znjtuf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH 00/53] drm: Convert to platform remove
 callback returning void
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JpdGVz
OgoKSGVsbG8gVXdlLAoKPiBIZWxsbywKPgo+IHRoaXMgcGF0Y2ggc2VyaWVzIGFkYXB0cyB0aGUg
cGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL2dwdS9kcm0KPiB0byB1c2UgdGhlIC5yZW1v
dmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkK
PiBjYWxsYmFjayAucmVtb3ZlX25ldygpIHJldHVybnMgbm8gdmFsdWUuIFRoaXMgaXMgYSBnb29k
IHRoaW5nIGJlY2F1c2UKPiB0aGUgZHJpdmVyIGNvcmUgZG9lc24ndCAoYW5kIGNhbm5vdCkgY29w
ZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRoZQo+IG9ubHkgZWZmZWN0IG9mIGEgbm9uLXpl
cm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0IHRoZSBkcml2ZXIKPiBjb3JlIGVt
aXRzIGEgd2FybmluZy4gVGhlIGRldmljZSBpcyByZW1vdmVkIGFueWhvdyBhbmQgYW4gZWFybHkg
cmV0dXJuCj4gZnJvbSAucmVtb3ZlKCkgdXN1YWxseSB5aWVsZHMgYSByZXNvdXJjZSBsZWFrLgo+
Cj4gQnkgY2hhbmdpbmcgdGhlIHJlbW92ZSBjYWxsYmFjayB0byByZXR1cm4gdm9pZCBkcml2ZXIg
YXV0aG9ycyBjYW5ub3QKPiByZWFzb25hYmx5IChidXQgd3JvbmdseSkgYXNzdW1lIGFueSBtb3Jl
IHRoYXQgdGhlcmUgaGFwcGVucyBzb21lIGtpbmQgb2YKPiBjbGVhbnVwIGxhdGVyLgo+Cj4gQmVz
dCByZWdhcmRzCj4gVXdlCj4KPiBVd2UgS2xlaW5lLUvDtm5pZyAoNTMpOgoKWy4uLl0KCj4gICBk
cm0vaW14L2lwdXYzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAo+ICAgZHJtL2luZ2VuaWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCgpbLi4uXQoKPiAgIGRybS9tZWRpYXRlazogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIGRybS9tZWRpYXRlazog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKClsuLi5d
Cgo+ICAgZHJtL21zbTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKClsuLi5dCgo+ICAgZHJtL3NobW9iaWxlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoKUHVzaGVkIHRoZXNlIHRvIGRybS1taXNjIChk
cm0tbWlzYy1uZXh0KS4gVGhhbmtzIQoKLS0gCkJlc3QgcmVnYXJkcywKCkphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcwpDb3JlIFBsYXRmb3JtcwpSZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
