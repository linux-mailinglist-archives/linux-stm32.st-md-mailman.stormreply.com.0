Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A633D6D0B6C
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 18:37:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54B2FC69069;
	Thu, 30 Mar 2023 16:37:08 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E75C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 16:37:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48A09B81ACD;
 Thu, 30 Mar 2023 16:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CBBC433D2;
 Thu, 30 Mar 2023 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680194225;
 bh=XtkTqKmTa4Do1XyOce7YzTky9wxy6vDupU7eV9YHHU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RWz/ueiq9vsTB+H3xBBBz399wWJy4F7Hdxpqv0psAN28iHmxSkqGVKzXwWSXJxmaP
 Rfvh1cC+J7XEwd7djFmURcbbNDpjm9FVJL+jt3EPCgUrnX+RttHzidJtL7ufpZVR80
 bUwVV/B8c+wmnxo+V+pLQYaTcE2T6AOTudmn2WGnAv7zM2JT1S55JAM3/6NcdpqO6r
 PO2oawUzOC2uADudFYTyztPVMHIOWOXWBCw3csYlIp1PHSHRoru0SUqGD2EgCYmFpr
 4kGdaxYPY5ZPy2XphwWsuLTgeKj5ODBZ86ET6FrrARLdwVFpuhl+EGx0UrJUgG5iBd
 fJXS4g7pZG6rw==
Date: Thu, 30 Mar 2023 09:37:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230330093703.6be37eb7@kernel.org>
In-Reply-To: <PAXPR04MB9185649FB402ACF46BF47434898E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230321190921.3113971-1-shenwei.wang@nxp.com>
 <PAXPR04MB9185649FB402ACF46BF47434898E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Eric Dumazet <edumazet@google.com>, Wong Vee Khee <veekhee@apple.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 dl-linux-imx <linux-imx@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: add support for platform
 specific reset
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

T24gVGh1LCAzMCBNYXIgMjAyMyAxNDo1NTowMiArMDAwMCBTaGVud2VpIFdhbmcgd3JvdGU6Cj4g
QSBzb2Z0IHBpbmcuIPCfmIoKClNpbW9uJ3MgcHJvcG9zYWwgaXMgbXVjaCBiZXR0ZXIuCkp1c3Qg
ZG8gdGhhdCBpbnN0ZWFkIG9mIHBpbmdpbmcgdGhlIGxpc3QgOnwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
