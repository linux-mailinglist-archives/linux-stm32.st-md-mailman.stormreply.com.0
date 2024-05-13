Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C68C4540
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 18:48:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4260EC6A61D;
	Mon, 13 May 2024 16:48:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96A6BC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 16:47:54 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso3435808a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715618873; x=1716223673;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8IABxquNN82B4Xu9DV5YC8zIRR2xm8Fe3dsJQpGZVM=;
 b=FHp10gKakrA3gPmRW3OAI2SdQzva+ExR1BDe1WdqLPGld83TZXm1FBAX5Qwb6I8PkN
 avoDPcFIR5YO/zxjOcm/s+4nzrvlnVRzdTNMLArFNgI0WWw0M1dgi60oMEcQkZtiAQLt
 8MTfxFQkunesNkrWRRtRE/g+BjnzxiqqT+8QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618873; x=1716223673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8IABxquNN82B4Xu9DV5YC8zIRR2xm8Fe3dsJQpGZVM=;
 b=JCsHLHsPduBBzjU71rUzy0DvL8mJcRarYscpT+EVbhoHqYKtnRI+F/sNyOnPNERzww
 mLsLkfe9vvAtKYo8F7qnXeNY9h2CWeUwS/BYb+g1DaszzRRxtt1IhzeP/sywdehpux4+
 zo3/foMO/Bbm9r9gTSWS66r0uHpQU+iAwU4rXsIfYHfHAfRY/fwaF+hb9BenStsS1qh6
 hij9f/l8hcHavp7ONPx0s2Dn/yTPsGIo0F/I1Xh90f6lnuXNI5Uf4KNF4r6+MGjCMd92
 0f8pC9JMVBDW2vw9yn/i81aJfFSysXdAO5hm9dmhj581OcdPLFH8wsYaQo15J9JRWURO
 lN9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLP1VWEXMA42RRbOhp5sPsWjFX0HQ4jBoYfVC5bqAsJWYEfl/8XeFOY8aKgxusApyLiW2GeH+pb2fOGk+5QLMonU3e4epk+VwQklBu3KUR4qsTAl+csjT7
X-Gm-Message-State: AOJu0Ywpk0Ftznu5t42Oak1og3U9DPAhQKkAoAn7mu52qfy0eejsnYQG
 qs/UDYlDaKBgbG1/UwOXisVrdzNwOBo9/Wm68sKVx97fYPDs8ozlL15P7QyFuh4kZNbBWJN6mgx
 SUnU038Jy3o+hgXCCGlFDlBQny6EybmnX/BkW
X-Google-Smtp-Source: AGHT+IGLX8YyMQWNC2w5RpKY7qMMS2Qj8enHy3NsQmRbp9Nky6fT7t9O5Kidzevyld4hoT1P6kK1OijrTCyqfgIWG1g=
X-Received: by 2002:a17:90a:df91:b0:2b6:228a:213a with SMTP id
 98e67ed59e1d1-2b6cc14b7d5mr8862682a91.4.1715618873160; Mon, 13 May 2024
 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <20240510190830.54671849@kernel.org>
In-Reply-To: <20240510190830.54671849@kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 13 May 2024 09:47:41 -0700
Message-ID: <CAMdnO-JUKU_f9-weHpkOH=NTpp-ZV1mm6rvp0r91kz3M844tHA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
	2/2] net: stmmac: PCI driver for BCM8958X SoC
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

U29ycnksIEkgd2lsbCByZXZpZXcgdGhlIHByb2Nlc3MgYmVmb3JlIHNlbmRpbmcgbmV4dCBwYXRj
aCB1cGRhdGUuClRoYW5rIHlvdSBmb3IgdGhlIGxpbmsuCgpPbiBGcmksIE1heSAxMCwgMjAyNCBh
dCA3OjA44oCvUE0gSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBP
biBGcmksIDEwIE1heSAyMDI0IDE4OjU5OjI0IC0wNzAwIEppdGVuZHJhIFZlZ2lyYWp1IHdyb3Rl
Ogo+ID4gdjI6IGNvZGUgY2xlYW51cCB0byBhZGRyZXNzIHBhdGNod29yayByZXBvcnRzLgo+Cj4g
UGxlYXNlIHJlYWQ6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL25leHQvcHJv
Y2Vzcy9tYWludGFpbmVyLW5ldGRldi5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
