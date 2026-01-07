Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47295CFF7EB
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 19:38:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDD06C8F282;
	Wed,  7 Jan 2026 18:38:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9D9BC8F281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 18:38:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B87F43668;
 Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11763C19423;
 Wed,  7 Jan 2026 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767811114;
 bh=UnoGgK3rZulvQ7+7qKRL2PAUxy2h9dm7tc2RPR5H5pk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zjtv75C8bU6LOSZ3PZHsIZhImci8OB9N3l4n+g4QJw9+EZUskkZVAM1UPtmIWq8qD
 9y/QTHTfTxYeOHOawoKRbbL6WzEkQNUcZ9t+s6O58Apsi/7VGvWziIs5WaDXdB3xIT
 ZZ4PTBLu72sZtSwmLEO3QscMYE8XJSixFJRNEqmKAKNd+EAEgG7e2pE1qc+hBXwn3x
 7R8UKQBuL2Q0mUw7X6NTXCKWmje4q8fy/C+ZG61+QtwTbCNWAZOHIOYRNySKRWDYn1
 iIPWudv/JqxQTi8ZwuwCYId8saayD+UOlRFVcAhLT7cLWzNCC0xoZEU1dm//iCbSlV
 khtt+7PhnJH5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed,  7 Jan 2026 12:38:21 -0600
Message-ID: <176781109968.3262943.4143830345398842895.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] Add the support for SM8750
	Camera clock controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Tue, 02 Dec 2025 15:56:24 +0530, Taniya Das wrote:
> Support the Camera clock controller for SM8750 Qualcomm SoC.
>  - The camera MCLK BIST clock controller, which is required
>    for functional MCLKs.
>  - The camera CC (clock controller) for managing camera-related
>     clocks.
>   - Additionally, the Rivian ELU PLL is utilized within the
>     SM8750 clock controller, so support for this PLL is also added.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      (no commit info)
[3/3] clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      commit: f9580bafd39cff31bd51031e8784ea44acddf20e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
