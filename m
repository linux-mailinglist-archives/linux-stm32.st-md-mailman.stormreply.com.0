Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92A9AC992
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 14:01:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1BB1C71287;
	Wed, 23 Oct 2024 12:01:05 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5237C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 12:00:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f53973fdso735281e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729684858; x=1730289658;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tqbz9ghi25MyNM796HfNIo/wGiHciMSp9xBKYdZMdzs=;
 b=dPC2MiYckUpa9DD5M0qaTFLyCK5IU8OzV0KYS088DkBcNE7OdOpWVLf5ucYEaVB+8U
 obYZwqHDJSdwFilTNrBYIknOvNGHtUfR8JRUvPSAj384wYq/oLrsr4eAJSuN70ABUs5I
 SQmbb9H+ySxHIRt7Sfmjol3jsetq5So8bbKTPqZihTCQ9MrpmT9FQDbmrGvxAl9+eOPH
 SJEpA97X8YQc+e4kjdDCnm6P/zTPRlvkMzL7nqJjSklo0m9uA+WaSE3oRSHmBA8odaWA
 yejuDtMoBDlcCRU1/w4RjLe3rTXct0il5waR279Rmxl4LVPPoL/PAiWR84ftZXx19vbm
 cHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729684858; x=1730289658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqbz9ghi25MyNM796HfNIo/wGiHciMSp9xBKYdZMdzs=;
 b=YytHDvIztUjimKQx27ttVL0cHU0bcmUPsLft0S86MlU1pY5H3XIeueSVE/Yt4lQPx9
 MZMhCCBi1B97G9O+LWzReSBh+O91sOqn1nrkjrEHYsQfkkbEA+tHWBvgJD3H+TXYbQgb
 r/HoWgQHtZ/rB9WKyS/Tm1/03nsBZ5EHJw8Q8Taw4I5JZysvsSjOPpts5q8iHR8SWQNK
 eOEtlqMSlG5NYkA52QRG0k2vI9KtpViCZN2AzTWdHtMgsGA3CV4ZnDb7RtFeT2L7lNps
 E1QvU/OjX538j/9l9P34Ic4gdLtAmKMZ4nm5rzFlNMCBgnkcih8YGGxadprOqwgyh9fW
 iilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbmkCY+NaYXptAxuBV6/T3OoweOaqQVnWiRPdX/cYtAm2Mw7aYybX4JODPUEH7aP8EUZ38T/7t46dBNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1WltCCYAV0hoks5j6GFM1LKg2q1Pz52rft1nmnHs0ePIFeAHF
 QCjxDF3fRIhdTHRqplW/v+X6k56WdDzjuj1XOesZyLKEfdurZ7oFDLBxELGWblfAmB/QJeyr03J
 5+iOH0c3XXAyJzV7xZaiDlvCqUDlrEupNgMFXTg==
X-Google-Smtp-Source: AGHT+IE/UAzMY7V3eb5pkqaftwZ38vfA7061nJlGo03pDJqYCoLAKz73v+E375hMTpCsOw6OHL/EGlBNyYbkCpt8l/c=
X-Received: by 2002:a05:6512:3992:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53b19c41fbamr866738e87.4.1729684857664; Wed, 23 Oct 2024
 05:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
In-Reply-To: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 14:00:45 +0200
Message-ID: <CACRpkdZfbjorFjZ9P7ifYO4mVa7eVdviyqO8+KjJXW3bhOq7aA@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, 
 Melon Liu <melon1335@163.com>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] Fix KASAN crash when using
	KASAN_VMALLOC
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

T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgMzowM+KAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoaXMgcHJvYmxlbSByZXBvcnRlZCBieSBDbGVt
ZW50IExFIEdPRkZJQyBtYW5pZmVzdCB3aGVuCj4gdXNpbmcgQ09ORklHX0tBU0FOX0lOX1ZNQUxM
T0MgYW5kIFZNQVBfU1RBQ0s6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtl
cm5lbC9hMWExZDA2Mi1mM2EyLTRkMDUtOTgzNi0zYjA5OGRlOWRiNmRAZm9zcy5zdC5jb20vCj4K
PiBBZnRlciBzb21lIGFuYWx5c2lzIGl0IHNlZW1zIHdlIGFyZSBtaXNzaW5nIHRvIHN5bmMgdGhl
Cj4gVk1BTExPQyBzaGFkb3cgbWVtb3J5IGluIHRvcCBsZXZlbCBQR0QgdG8gYWxsIENQVXMuCj4K
PiBBZGQgc29tZSBjb2RlIHRvIHBlcmZvcm0gdGhpcyBzeW5jLCBhbmQgdGhlIGJ1ZyBhcHBlYXJz
Cj4gdG8gZ28gYXdheS4KPgo+IEFzIHN1Z2dlc3RlZCBieSBBcmQsIGFsc28gcGVyZm9ybSBhIGR1
bW15IHJlYWQgZnJvbSB0aGUKPiBzaGFkb3cgbWVtb3J5IG9mIHRoZSBuZXcgVk1BUF9TVEFDSyBp
biB0aGUgbG93IGxldmVsCj4gYXNzZW1ibHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpBcyB0aGVzZSBhcmUgcmVncmVzc2lvbnMg
dGhhdCBuZWVkIHRvIGdvIGluIGFzIGZpeGVzIEknbSBwdXR0aW5nCnRoZW0gaW50byBSdXNzZWxs
J3MgcGF0Y2ggdHJhY2tlciBub3cuCgpUaGUgOTQyNy8xIHBhdGNoOgpodHRwczovL3d3dy5hcm0u
bGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzL3ZpZXdwYXRjaC5waHA/aWQ9OTQyNy8xCgpO
ZWVkIHRvIGJlIGF2b2lkZWQgYXMgaXQgY2F1c2VzIGJ1aWxkIHJlZ3Jlc3Npb25zLiBQYXRjaCAx
LzMKc3VwZXJzZWRlcyBpdC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
