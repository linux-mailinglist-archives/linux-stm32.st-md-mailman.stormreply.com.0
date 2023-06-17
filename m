Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39F733F12
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jun 2023 09:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1770FC6A61A;
	Sat, 17 Jun 2023 07:16:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CE8FC6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 07:16:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16D3D61119;
 Sat, 17 Jun 2023 07:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6C6C433C0;
 Sat, 17 Jun 2023 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686986206;
 bh=SXMxzkupl69XgQE1gIRNMtbifDnHxKajI1lVuAlonhI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pR9bjbOFinCB4jeZ+6kRKbxOCYZNNR4jPikGiYb/Q5EDZK7KRVBI+lFOSVwqD8w5Q
 vzg3xmAjpYJg2W3sDGRBzkh90n734ANb7DUTsjNAXsziVxxtbndq+3S+dDcnvzsafD
 7OVzrKCUKz+syiDlVQyu2xeffY/I46oS04G1wbKcuaKW4pPMzK1WJhuDZydpaeGGoI
 r0PErEKExgQj0AkaSJ7EyT5HW8TcZTP7eRzXFB3iomZs8i0Z4bcAgBKeNo7xfq+tli
 cT0NiW5cXDq1orS53xzviD4aONKfYKtwZMq3cfxGV64NOK/Nby6JO9MAyr5nxuNPRV
 WuHcOk04Oh2aA==
Date: Sat, 17 Jun 2023 00:16:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230617001644.4e093326@kernel.org>
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 00/23] arm64: qcom: sa8775p-ride:
 enable the first ethernet port
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

On Thu, 15 Jun 2023 14:13:56 +0200 Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There are three ethernet ports on sa8775p-ride. This series contains changes
> required to enable one of the two 1Gb ports (the third one is 10Gb). We need
> to add a new driver for the internal SerDes PHY, introduce several extensions
> to the MAC driver (while at it: tweak coding style a bit etc.) and finally
> add the relevant DT nodes.

Did I already ask you how do you envision this getting merged?
You have patches here for at least 3 different trees it seems.
Can you post the stmmac driver changes + bindings as a separate series?

>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 451 ++++++++++++++++++

Noob question - what's the distinction between drivers/phy and
drivers/net/phy (or actually perhaps drivers/net/pcs in this case)? 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
