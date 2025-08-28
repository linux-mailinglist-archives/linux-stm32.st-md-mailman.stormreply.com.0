Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A91B3A269
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 16:44:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C433EC3F95E;
	Thu, 28 Aug 2025 14:43:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45BC3C3F95D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 14:43:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb6856dfbso194019666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756392237; x=1756997037;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+wN+lwhqYoTKxVX6uQN/sHMwauGJ+RriAyxhBVnStc=;
 b=HCtPMjz+nmmY/YVEfviPHwIRUzdTNqSWOkYhp+Va2IRbFBGtsM+6tl/6KHjpG/wbiW
 fVcQuIL4fZ7RynhzKBrHcyi5PtpQjO/CGlORTPYjxVuDTa9FXsh/9ovxLy/z/czag2K6
 6YXL2WGbjCTDn/ZYO03omw4gKd/E+bHQjeA85oPXI+buCfab/SZ7aW0jlpNTRmEa88IE
 pB2Jm3fus7UwKt3jXmXYs/Z6gvnimSV0G/VFCSrArfrBS1bwSE1/5vCa47RQNjNf1ZKl
 /Y7gmvt4SLuMtizckjWNJerez0EzTd58Nv64KMoXAqXsOXob6Ip7FqStr8WdgWP4TTvh
 tomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756392237; x=1756997037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+wN+lwhqYoTKxVX6uQN/sHMwauGJ+RriAyxhBVnStc=;
 b=HJPEdBhiw8SulVbNiAbDTmjd9Mz2jjoATJ119/bUBG+UWjZYQmYT66toufl1Mwju79
 K8PqjD/A8WF6XLv9X40suQoh9rLbC3cz6BCVaE/4/s5JCstsugk2uC4hH526MW/yWkJ5
 RdVtVh6nWJPggXgxkJXC5AskKDzSZzCbhZ4YktKZ0NscXlCuJEYxgdt75m2TWXEFJ9tX
 YWMvdFV0BQdscKSKw+8fyef0Wf38dtT2E+Alpm4ZQcBWtKomSF5mYUe+yNWdiWY/aKzj
 93R943bYxz9acVYxnC+15bg4kAhBWn7Tcv19agYxjxAXOQv46LfT9XPsOxLt2cAE2DXF
 hTfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+5aTcnXjb7/5DnG5V3uRaMlPj0NFuVJFteJBmG6HS4qOUWPA6RK4jVRtxusBPIHP9I7BDT87TkpW1kQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/ihxJCDMb6TfKnR8yXUyNkkDlKWOKD/s2S2Iuygq2tuwGMu/U
 eMkW+lSD81GbU2smZStUBHweLlKIL7MmX2On96V+K3Pd9GBIH2sNTaKN3o4GWh0D4hnAzdO0ywm
 v6SCW+8tMzbAa1x7DABO17ov35Qt7Zvw=
X-Gm-Gg: ASbGnctqt1lY04FoQf9f/8dztwRY3qrrbwuvYBpeF00wfdAsoGd/+B8xkiKja4Y5L9M
 lUnz9SApvGpvZAlaemeIMRNh4/uZEGu86Xj7gsF1smmPjJve42oigzqAIxqE3U8hskzVxLxLBj0
 UJ1T1Wgw9Qbqmjw5Ubxp+ke2O75vDAn/PiTzjdUexcO4dCa9kGp6tXxnn5Tul0WJ8DJAXWzvnhY
 MMZ+o4Eo2U47Io26A==
X-Google-Smtp-Source: AGHT+IHSpV38jN3vXlwaE5Hc/33kYxgkSGU7qt3cnFjrbvgWPlGfvWhPC35RdoWMMw0cLo0RpnrmYHf9TYgJV3EIk80=
X-Received: by 2002:a17:907:7ba7:b0:af9:479b:8c80 with SMTP id
 a640c23a62f3a-afeafeccd92mr974083966b.4.1756392237310; Thu, 28 Aug 2025
 07:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Aug 2025 17:43:19 +0300
X-Gm-Features: Ac12FXyTLkbkyCMLdfg5IxUIPPUzIcPP1Ugg5myE3SihT1YJg_dhgWhZBLYFxok
Message-ID: <CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/1] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgNTowNuKAr1BNIFNha2FyaSBBaWx1cwo8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZCgpLCBwbV9ydW50aW1lX3B1dF9zeW5jX2F1dG9zdXNwZW5kKCksCj4gcG1fcnVudGltZV9hdXRv
c3VzcGVuZCgpIGFuZCBwbV9yZXF1ZXN0X2F1dG9zdXNwZW5kKCkgbm93IGluY2x1ZGUgYSBjYWxs
Cj4gdG8gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLiBSZW1vdmUgdGhlIG5vdy1yZWR1bnRh
bnQgZXhwbGljaXQgY2FsbCB0bwoKcmVkdW5kYW50Cgo+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1
c3koKS4KPgo+IEFsc28gY2xlYW4gdXAgZXJyb3IgaGFuZGxpbmcgaW4gc3RtMzJfZGFjX3NldF9l
bmFibGVfc3RhdGUoKS4KCgpDb2RlIGxvb2tzIGdvb2QgdG8gbWUgaW4gdGhpcyB2ZXJzaW9uClJl
dmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
