Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D195EC31
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 10:41:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B438C7801B;
	Mon, 26 Aug 2024 08:41:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5317AC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 08:41:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f40a1a2c1aso35258591fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724661672; x=1725266472;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJqPV+M2ayctdGZHxpg+AofznRAfzm17VKe00rGKdUU=;
 b=Rj/AD236yG9pYR5MbbaCGpB2J6N1/Ur0VGpGMcG741jJ6oTmLqrzVeoJc6rXLEbApD
 p5REnEm+SA/6g58/itj048067iBm0fZdh4xDWEUus9D7wV+mDGhWSHKvAnuQjobPKD9w
 O9waAcV4iSaT/dzjfg0h2czWLwwEs3z9yGbH8VDfYZbb2pqimB/zJwcO4hA49xU7jtpI
 2ndqgJjq/FgJORIyfud+/dYzAvVWBRAJIvV+uoz04tPUgYwjF0vw+Y9obDBau93Q9X8z
 kyCQdRoCVZHtr4oTuzAKS+Nbz/k5p0Dp6P0zdqyEUdjQWgQIkMpolkg5mWaUqnYPYWoO
 uDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724661672; x=1725266472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZJqPV+M2ayctdGZHxpg+AofznRAfzm17VKe00rGKdUU=;
 b=Z27iB0/N62znKDdhOA1h1VUB+jdiv3izJDPwGORpwhFrHq/YsizSUdiPkiWW4O3aV6
 CRMB8SVkIgnxhDdiIjakMcoC33+E5THyLsc7B7tCKKvFww6q3Wwmu3WFCxISucLmAtTy
 zsy8wqtaD5p39yMiDsKYNjS2EoCTaCa8zCY0RspRajTgIx7NYv3XJymExS03+giazvl/
 d4zXZVSr3GSp9HqY9EqFSSVF8G1CU2msvrpWgA2E5iSXiTXj7UmxRAjc6dRrgh9kNVqK
 Tm+zmIq6dd2ODb4OYpKjcwGDlswbyU+U2QNFy6K/S5ywnG7bsjyH8sFkFhv4v63kcPOe
 TNdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Ea0Is8Becn9Hn64qk/qG5sWwncKnr3g8BZAWJ5h/6aTvJzLaPrnLGQuZWSJGRkfCs1eTyZVJrLNF4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6r5TNMIG/WZCPh5dKY7gnhLHM6dAUncgODMfZPjuzeOzTI8+S
 bfnG2+9FnaXXLkOtqtqnWw9iBAIufXTN90gwejWHgsTXxJ81Y1lAbc1v/BTQYr26JeNtiJZI5+I
 5pd2/CDjcngdRvZ0EfjZWOCmNgUlSbgCkYEA6Gg==
X-Google-Smtp-Source: AGHT+IF1xip2LZYxVRH8VpdWfcRa9uK7A6loLJRPHfWQskmDHQEUYxjPeikly02OaJhz/cUtMMvnXB3y1yNyya30do4=
X-Received: by 2002:a05:6512:3c85:b0:533:966:72cb with SMTP id
 2adb3069b0e04-5343885f659mr6807476e87.48.1724661671918; Mon, 26 Aug 2024
 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-4-frank.li@vivo.com>
In-Reply-To: <20240822084733.1599295-4-frank.li@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:41:00 +0200
Message-ID: <CACRpkdb-MKYAcWA5KUDZ=oeREs86S68WjqzS9XRTrUbBhLbBtQ@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, linux@armlinux.org.uk, hkallweit1@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, shannon.nelson@amd.com
Subject: Re: [Linux-stm32] [net-next 3/9] net: ethernet: cortina: Convert to
	devm_clk_get_enabled()
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

T24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMTA6MzLigK9BTSBZYW5ndGFvIExpIDxmcmFuay5saUB2
aXZvLmNvbT4gd3JvdGU6Cgo+IENvbnZlcnQgZGV2bV9jbGtfZ2V0KCksIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIHRvIGEgc2luZ2xlCj4gY2FsbCB0byBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpLCBhcyB0
aGlzIGlzIGV4YWN0bHkKPiB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
