Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1C6AACC8
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Mar 2023 22:53:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52A7DC6904A;
	Sat,  4 Mar 2023 21:53:14 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0CAEC640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 21:53:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id u9so24007532edd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Mar 2023 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
 b=EjDJ1R8FKouJnuSxadiRe5SiBIgUSITPbM9SnQjhYDyIZ+LuEOc2GfJjRvdd1K10zP
 0B+VLs/N+kcVjphefjob7VPueiCtPcbheJAVql624mVmTFTwLvvcp1iZwDpKctQLPUHW
 891sEv52O94DJnZ6KiXRE4F/ROjfjMTPMKKI+OF6yfwNHXTh46djS1YKS+5RgOvxGYeH
 ZkMiXVI3btf5P7xmeL3czwdHnO3oxMI8+Piuk+XkuMFjbmF1+Tu4Euz0RahvlkxQA0+9
 WfciGbFo0TezFdbslWClljVVfxIS/uCJg+p/6L25hJAymiS1NrGxJW4JFm2298dmi6Zx
 AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
 b=E6HMy/jOPCyVjDiinOgW95h3YbLkm/O2bYM8e2k/EaAgjs6AdSYkTInfiEBbQmfSFn
 6n/n3vUs2EKojDAOxAao5WJvH7xVx+8Iyl/fHn3sKS//9XXqkYjws8Ea4l1nxPVxnbtg
 zpSMUFrezRkhXwTe5zPaZk+1eOPC2B4nHJf75Ei7Gs41hc7q4IGtKCeXNMZ3gOH0CPU+
 VOhAA4ReMvZwmPbnXHsT0JiMgBFbO8RCF+17gPWNUn4whD/j5Alu14ApVR3f92EJZjNz
 YD8uyFHqqhWqHrXm6SlRCNEdNaFwUIJcm3uHiu3vMj7N3zCSigkU96Lj9F83VYa2uryH
 poVw==
X-Gm-Message-State: AO0yUKVRKjQ/080iAGkVv0J/dk13RcYgxVUz8dM5xx/SRH+FF8tBx43Y
 ox70Tnj8rS+ZmfMITRap8w/VCZNKvvPjdW5j2FE=
X-Google-Smtp-Source: AK7set+tmz2IUyxluM6H0uJ7rtHOVvVTQ1X6COH7sceQzb5b5yCqFKVzBbXboRNMEcYH9cGeInLEcv9muAb3OM5khBI=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3356647edi.6.1677966793189; Sat, 04 Mar
 2023 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:53:02 +0100
Message-ID: <CAFBinCCV4yu1HszSaCJuNVMhDC35hA8cpzLMw1x=a3x+LNYrEw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org,
 edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, andrew@aj.id.au, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 11/22] drm/meson: Use GEM DMA fbdev
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
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gVXNlIHRoZSBmYmRldiBlbXVsYXRpb24gdGhhdCBp
cyBvcHRpbWl6ZWQgZm9yIERNQSBoZWxwZXJzLiBBdm9pZHMKPiBwb3NzaWJsZSBzaGFkb3cgYnVm
ZmVyaW5nIGFuZCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
