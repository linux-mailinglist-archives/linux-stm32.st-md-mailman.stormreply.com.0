Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBB83F898
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Jan 2024 18:46:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42E30C6A613;
	Sun, 28 Jan 2024 17:46:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD6D7C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jan 2024 17:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9569661BC2;
 Sun, 28 Jan 2024 17:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F0EC433C7;
 Sun, 28 Jan 2024 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706463969;
 bh=kPoqfY9K78eerpaz+5IEw5d038Vg8EM4N2U9dT+Jg+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZpFb5uSYe3ZaQubiOpkh6P4No+W8WlTjM+sivoKwZO+hSMN/cgiFW9VFKjfmMzCgW
 b3DaV9aOaEA6s2VEZWMvHQ1E4RKFnsjQYqWXxJIeWX0MM9G8LHJiKA3kQE/BtiWG8R
 3i4DnLOUz3MMvn6uFRopnMnUCX86gaRnZU0ZoQgBnmUFfwbY90zVUFTVtR1trpzYEL
 jgH+mM53nvb5yy06VaJV/KHlGx/N0bOjWuNHuLABhLHaKW0IP9xVL6PzpArOgBTKYl
 A9v0LOrSd0jNU0C1SlSIBfbH4J8M3qgW+QjqbiW0zFYlLpVVLR7uYiRK3MEPovpgat
 v4m71ZDK6UWzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>
Date: Sun, 28 Jan 2024 11:45:51 -0600
Message-ID: <170646395040.64610.3852658876222651330.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110111649.2256450-3-quic_jsuraj@quicinc.com>
References: <20240110111649.2256450-1-quic_jsuraj@quicinc.com>
 <20240110111649.2256450-3-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] (subset) [PATCH net-next v9 2/3] arm64: dts:
	qcom: sa8775p: enable safety IRQ
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


On Wed, 10 Jan 2024 16:46:48 +0530, Suraj Jaiswal wrote:
> Add changes to support safety IRQ handling
> support for ethernet.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sa8775p: enable safety IRQ
      commit: 7e4ed7db95279d37e9934e30d84bd7335d0a224b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
