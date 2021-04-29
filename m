Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555E36EAD7
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Apr 2021 14:48:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B3AC58D5E;
	Thu, 29 Apr 2021 12:48:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D2B3CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 12:34:02 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id c11so589071lfi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
 b=pSAPQilu7n+6xTr9GdEG0tb6PJM12QM070qCxvHnWCIze3Gcr+Y1X+IbvGDtRxTUgM
 EyOOFTxf9hWQBlaRIuLofOaQebEe5v0gWxDauGIRIaLBxzQZQULJfZHJUKxGdkb10gkc
 nD1wHPGKwDBP5o9agABg3XnIArwOCYPQSKMjVhR3w59xhvXls6FFml/j10Pwe9czFo6Z
 T7faf5Qfz88VW86L60gbzCGia3II+upwMhl4urxCbGztadHzxAw5ZUEZZpuSIrEqgrti
 aMKp0DRksQp+N/9uThNAeaKzsoGRnRjp6oHq0CgRtj1ykP9X5KS4ubBguxOUwo/dtsF4
 c+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
 b=rSb4NhYxEDlGOmE6D40ncY/Dn2Hh2vSp5Fn8RD9nFq4iu+ZqplwnnpZh9xTRf0vkW7
 o97M7Tg6FtfR3EC6NY5kOKhEK+mTqtWsLXMRubJrPaiZB+sKovfk3rC0Lx9CvCTLZEOQ
 Se3KpBxNxkpjO7aNnOvMQeDz5F1c/dyAl12PIYk0bQBOU5gXJs/8LW0+nO304SvVEI4N
 /LwKEOdBu4fs9+VmQ3yXNgfrXtc2cgfsLPI9BuwcSLcyL+dWuq941QOQFI+TI/PrmIQL
 QBplRZ9Q1lD2S0FE3YyshmCLh1ysIhwYfURSqMtXD+0nXKRqRPAZc+/8EspXPDC+wguq
 R0Sw==
X-Gm-Message-State: AOAM532VYRRyxGaRo9rhgTpZSVyWe/SEocmjQ5QjmTJwu1HaXYImxLyO
 H4qjIylMZ/9jDlN4pJ2/F+o=
X-Google-Smtp-Source: ABdhPJxNUnx9qkfhLC3V1HtbXkiFpJiCYsEDSOon3AoeX+SG0EchdE86xX8g0E/VEPlskxpayZqx+w==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr24627108lfd.306.1619699641558; 
 Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru.
 [109.252.193.102])
 by smtp.googlemail.com with ESMTPSA id n7sm515001lft.65.2021.04.29.05.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Johan Hovold <johan@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <YImEMN/POW5C8lG7@hovoldconsulting.com> <20210429121215.64a7cbdb@coco.lan>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de636a0a-3fd7-d61e-c361-fa50a6d34f17@gmail.com>
Date: Thu, 29 Apr 2021 15:33:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429121215.64a7cbdb@coco.lan>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 29 Apr 2021 12:48:16 +0000
Cc: Ricardo Ribalda <ribalda@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, mauro.chehab@huawei.com, linuxarm@huawei.com,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Leon Luo <leonl@leopardimaging.com>, Dan Scally <djrscally@gmail.com>,
 linux-samsung-soc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Matt Ranostay <matt.ranostay@konsulko.com>,
 Andy Gross <agross@kernel.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Tu <shawnx.tu@intel.com>,
 devel@driverdev.osuosl.org, Jacopo Mondi <jacopo@jmondi.org>,
 linux-tegra@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Benoit Parrot <bparrot@ti.com>, Helen Koike <helen.koike@collabora.com>,
 Yong Zhi <yong.zhi@intel.com>, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 linux-arm-kernel@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>, linux-kernel@vger.kernel.org,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 00/79] Address some issues with PM
 runtime at media subsystem
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

MjkuMDQuMjAyMSAxMzoxOCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiINC/0LjRiNC10YI6Cj4+IFRo
aXMgaXMgcGVyZmVjdGx5IGFscmlnaHQuIFRha2UgYSBsb29rIGF0IG92Nzc0MF9yZW1vdmUoKSBm
b3IgZXhhbXBsZToKPj4KPj4gCXBtX3J1bnRpbWVfZ2V0X3N5bmMoJmNsaWVudC0+ZGV2KTsKPj4g
CXBtX3J1bnRpbWVfZGlzYWJsZSgmY2xpZW50LT5kZXYpOwo+PiAJcG1fcnVudGltZV9zZXRfc3Vz
cGVuZGVkKCZjbGllbnQtPmRldik7Cj4+IAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoJmNsaWVudC0+
ZGV2KTsKPj4gCQo+PiAJb3Y3NzQwX3NldF9wb3dlcihvdjc3NDAsIDApOwo+Pgo+PiBUaGVyZSdz
IGFuIGV4cGxpY2l0IHBvd2VyLW9mZiBhZnRlciBiYWxhbmNpbmcgdGhlIFBNIGNvdW50IGFuZCB0
aGlzIHdpbGwKPj4gd29yayByZWdhcmRsZXNzIG9mIHRoZSBwb3dlciBzdGF0ZSB3aGVuIGVudGVy
aW5nIHRoaXMgZnVuY3Rpb24uCj4gT2ssIGJ1dCB0aGlzIHNob3VsZCBlcXVhbGx5IHdvcms6Cj4g
Cj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfc2V0
X3N1c3BlbmRlZCgmY2xpZW50LT5kZXYpOwo+ICAJCj4gIAlvdjc3NDBfc2V0X3Bvd2VyKG92Nzc0
MCwgMCk7Cj4gCj4gYXMgdGhlcmUncyBubyBhZGRpdGlvbmFsIGNsZWFudXAgbWFkZSBvbiB0aGlz
IHBhcnRpY3VsYXIgZHJpdmVyCj4gYmV0d2VlbiBwbV9ydW50aW1lX2dldF9zeW5jKCkgYW5kIHBt
X3J1bnRpbWVfcHV0X25vaWRsZSgpLgo+IAoKVGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSB0dXJu
cyBoYXJkd2FyZSBPTiBieSBpbnZva2luZwpvdjc3NDBfc2V0X3Bvd2VyKG92Nzc0MCwgMSksIGFu
ZCB0aHVzLCB0aGUgT04tPk9GRiBpcyBrZXB0IGJhbGFuY2VkIGluCmJvdGggUlBNLWF2YWlsYWJs
ZSBhbmQgUlBNLXVuYXZhaWxhYmxlIGNhc2VzLiBUaGUgUlBNIHN0YXRlIG9mIGRldmljZQpzaG91
bGQgYmUgcmVzZXQgYWZ0ZXIgZHJpdmVyIHJlbW92YWwuCgpJdCBkb2Vzbid0IGxvb2sgbGlrZSBh
bnkgYWRkaXRpb25hbCBjbGVhbnVwcyBhcmUgbmVlZGVkIGJ5IHRoYXQgb3Y3NzQwCmRyaXZlci4g
VGhlIGRyaXZlciByZW1vdmFsIGlzIG9wcG9zaXRlIHRvIHRoZSBwcm9iZSwgaGVuY2UgaXQgc2hv
dWxkIGJlCmNvcnJlY3QgYXMtaXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
