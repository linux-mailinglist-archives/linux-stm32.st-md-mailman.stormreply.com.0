Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B8754BE6
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jul 2023 22:02:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FD90C6B444;
	Sat, 15 Jul 2023 20:02:44 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAA03C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 20:02:42 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5703cb4bcb4so30249127b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 13:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689451362; x=1692043362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdWH8G7/JxibX+jq7eakhmn5wKNtr6QZ3AvIbtaoqT8=;
 b=Mz58cy0Kt3Z1+wShUaBgVHgGDxpamWmFASj+5ZS65vNBlFE6pTFSlbgIQtK3WVjA6A
 +KUDUfWpkPpfVAogO5+KsQ0NFfm4BuJ6J48O5EVdzzPyWBIRAJdmVrTJ41d8Z/0Qx432
 XmO4UHDIzyGxM4scnj2V1IhMoTLcV1dAca3Xq/Hj8Kk+mykf3bR9xZevexWBjlTWoopM
 ISqAgzN1N5wQT+03yQx6CLfib+MnnbI8bYyVHqasuJTUSIQ9cP2NTnaBKLsxUa3+9Gta
 uUHpWsRlPrzDyO6xEGmSb2Dqs6UvJlS9Ruyt6R0x+nLIo8WGFR8RtDlrRMmcGRY4ATWZ
 VnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689451362; x=1692043362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UdWH8G7/JxibX+jq7eakhmn5wKNtr6QZ3AvIbtaoqT8=;
 b=VFACX5TxHJK4SyTTW3bV7t1W1X4cRcLtcTX0lw/yDCffSNNgV7nTIKOGWOSGGALnnQ
 Ox6DPrGMgsCgqanLNvxmDwqCMTUF0lnYlPhTgLiB6XqUrsg7O3lYZL+TEAPMSibO3G4l
 CFzbes7ZVrF8ufIxrFWL7svsol1IEa8eKdrqtsCeyXtbrS8AzT1jm5zT5W38RrvjFPPq
 bX7/83D81CwWXUIKyU7fizSWJtbLw31LsL0YW7GFA42bobMa9chSoI3NJGlBX28jxKJD
 VsGDjvHCtW38d2fGq05D1tqGh0WLShaP+Vn8xDhDcLiqAawI8lnt0zsi+c9ZoNI22CYu
 clfw==
X-Gm-Message-State: ABy/qLY1uKEYyNCwTbw3kzpT3vkNf+C6Qc2rmbdkhyPB+SJZwBXzzmJ7
 wxNuknaS/bFw4OxH/DQbu5vdVEPmmIqHHBKzelApBQ==
X-Google-Smtp-Source: APBJJlF3v6Vw+WtzHjshzitoTc1qC7LX07Q2C3RsD1IvX+Ry88/4NSzUT7fZSVHUgs1bCHW1MQp7pfPnuQEYdOkovmc=
X-Received: by 2002:a0d:d4c6:0:b0:570:1a2c:5844 with SMTP id
 w189-20020a0dd4c6000000b005701a2c5844mr8288945ywd.35.1689451361822; Sat, 15
 Jul 2023 13:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
In-Reply-To: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Jul 2023 22:02:29 +0200
Message-ID: <CACRpkdYURZbTwyPz_1w94RfiK17KqYvjwXkTf5gbZxz5huKKpQ@mail.gmail.com>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/7] Support of HASH on STM32MP13
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgNToxNuKAr1BNIFRob21hcyBCT1VSR09JTgo8dGhvbWFz
LmJvdXJnb2luQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gRnJvbTogVGhvbWFzIEJvdXJnb2luIDx0
aG9tYXMuYm91cmdvaW5AZm9zcy5zdC5jb20+Cj4KPiBUaGUgU1RNMzJNUDEzIHBsYXRmb3JtIGlu
dHJvZHVjZXMgYSBuZXcgdmVyc2lvbiBvZiB0aGUgSVAgSEFTSC4KPiBUaGlzIHZlcnNpb24gb2Yg
dGhlIElQIHN1cHBvcnQgU0hBMSwgU0hBMiwgU0hBMyBhbGdvcml0aG1zIGFuZCBITUFDLgo+IFRo
aXMgc2VyaWUgYWxzbyBhZGQgc29tZSBmaXhlcyB3aGVuIHVzaW5nIHRoZSBETUEgdG8gZmVlZCBk
YXRhIHRvIHRoZSBJUC4KClRoZSBzZXJpZXM6ClRlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB0aGUgZm9sbG93LXVwIQoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
