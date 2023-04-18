Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDB6E68EC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 18:06:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1B2C6A5FA;
	Tue, 18 Apr 2023 16:06:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05F47C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 16:06:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6F3E6363A;
 Tue, 18 Apr 2023 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97195C4339B;
 Tue, 18 Apr 2023 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681833978;
 bh=ePPAUY9dJOFw/kK4NHB+f5qypog9sXqimbRgdM/SBcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s+udSpDHoT4p04HgM1AmuYzYBjhYlepMKYnmZH/3AMkwo8tWPH6XFHZzk19LiaBBa
 21WYUi5QMqvdLbV0lzNAcVJ2kTu0Pi+lGC75tN5EVDgOpkM86/4Te/m7N5s/qAiUD/
 oHdp7Nqn0hbwb3Ua79oEb4BTnlJlYrjf3qg98pVZZ1IdFRIjV72Yi55afQaCkRiAFs
 Y0PRxpQT9Ymku65e1BWkZwEiJ77ePgQfDh2AgjbG6aEvHso6sv7/JctyhFaH0yNvzm
 3u0i5yBYOPaPu70XRcXHXoF5cZ8cbUFmr6xe5Ov/gYmkLWSE7PRTyEfW3JYtFfqdtI
 mXEMGaxWAUxxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 18 Apr 2023 09:09:48 -0700
Message-Id: <168183418160.1484313.11791175608485998992.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
References: <20230327170114.4102315-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Drop unneeded
	quotes
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

On Mon, 27 Mar 2023 12:01:13 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: Drop unneeded quotes
      commit: 82f2734d99d7e6a2327ff4e2122dd0db425b598f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
