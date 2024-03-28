Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1788F9D0
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 09:13:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DB25C6DD96;
	Thu, 28 Mar 2024 08:13:37 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72F19C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 08:13:36 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so633718276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 01:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711613615; x=1712218415;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
 b=aUXRDwFQ+LFY1YYh9jNDLEoCF3bxEENd8Mx0jyNe+5Dv0+q1DVi9JD91LmoTpVE6HE
 M9Rs9xv5HjPPxepoHaTjmtyXzN+L+xK2e1Di6ZM+lswoVfuN5gQ1vS4OsBEY8MFDO/Cc
 D62wP3pOQSKIPw0yim2neMvQQhvSVX4GNlPYScV8a7vsLV9DrmtaxQigimnqyJWUvi1i
 bmpQcPJqBo8mElERpEWA6AJQ3mcyhIW1hDl+pGgNsp5XUYOwYPQpYteZ2Bjd78KCSCQm
 QFl/f5Kf0lXslbKhtotf7onjDDUzwJOdfFSECbxwuKEzmQxG0rRfpvLSPozF2vf9J1Uc
 HLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711613615; x=1712218415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
 b=qdMd8Yarn7nL+pYc9iEwTajHOk56urWE4JwZRELd5TG2kPkVvfeLlqXkZDaEsTZpIP
 BV32aeV39HbCyDpN9/OraO5z1c6AAiYLSQ1yWXEmYAoCJ95dFnE+3aiKnP3xb/w7Ez3/
 gGtn6vPshByYWJQ52kMSKIrFzaLX43YtgY0jKe3wCiv0r3ChDw6tLzDJL/1Z7XEd2c3N
 CqLTQY0QBc+GQ9XvuHl/KrcknFbaAu60g1KpcxDGFXGo9wydMsxxBToW2qzzNO5x8tzE
 WqpvAtnSmObPuT0gVk9VrkG5Pg+SBJfp9MndkR1HJ+6HMs+dqqd91m11MC9Mzaq5zgsI
 WFNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+53z7zT2Tm3qHArAxV95lqjvXZ4HuyxcvGUJx7iBPX4yvOHz8cOr3fxmoIcCb/0/f5U3meWo84/qLxvC5tymNnclpjfNGOpAuXuKauAyRtG0gSCdWQhck
X-Gm-Message-State: AOJu0YyFIufPE4cDWmOhozTdbyHyVFLukigNDpsaPW0Vyt4lj0CvYoE7
 HujA89E5TygCyW7f1I0J90UuiJWl1ClFFmeJGtUNTdv76DcJchYWKZcUtki4y7KtyfJ142Gz5R4
 YL31ycDcAd7BejWbhwqI65mnJSX1WCwH3X/99fw==
X-Google-Smtp-Source: AGHT+IGMP4Tk1rGQykOPNpks4MpJ7aMlQvkvBPR1XoNvNcoaKqQfOEDiNp35dK3mcwnlEPOwTL2pN8U5wfPMlD/HYFQ=
X-Received: by 2002:a25:4dd4:0:b0:dc7:4806:4fb with SMTP id
 a203-20020a254dd4000000b00dc7480604fbmr1887988ybb.8.1711613615243; Thu, 28
 Mar 2024 01:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:13:23 +0100
Message-ID: <CACRpkdaXWOp9C+7ahUO+6eTGodABW1D3CAGoE-6RrXbFcpd8OQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 14/19] i2c: nomadik: drop owner assignment
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgOToyNOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEFtYmEgYnVzIGNvcmUgYWxy
ZWFkeSBzZXRzIG93bmVyLCBzbyBkcml2ZXIgZG9lcyBub3QgbmVlZCB0by4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4KCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
