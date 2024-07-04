Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E377D927ACC
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 18:04:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92AC9C7129D;
	Thu,  4 Jul 2024 16:04:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0318CC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NUvYT0Apw8SqjInlbdvt2ov0pZsd3AGE3tETszdRDzg=; b=uctUXtstqOdYStp1RAdEevee8A
 og2m1rbeRGyNCyWKUOMtyM5AqIVxQFyxOPDwVFm9FnkbszNQ36vazTBa9yXYKCDMQBhsJURhhsCMA
 j1mTGX2YuuLQQvVFM9F5PJp4GaLgK5ASkZXssZl/rnBc5yDOus60fNPX7zh7xaHLB3Ec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sPOvS-001pKc-Qp; Thu, 04 Jul 2024 18:03:14 +0200
Date: Thu, 4 Jul 2024 18:03:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Message-ID: <add1bdda-2321-4c47-91ef-299f99385bc8@lunn.ch>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
 <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
 <f4162b7f-d957-4dd6-90a0-f65c1cbc213a@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4162b7f-d957-4dd6-90a0-f65c1cbc213a@quicinc.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 Andrew Halaney <ahalaney@redhat.com>, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 sboyd@kernel.org, quic_tsoni@quicinc.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, ulf.hansson@linaro.org, linux-pci@vger.kernel.org,
 mturquette@baylibre.com, amitk@kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, robh@kernel.org, quic_tingweiz@quicinc.com, luca@z3ntu.xyz,
 danila@jiaxyga.com, pabeni@redhat.com, bhupesh.sharma@linaro.org,
 athierry@redhat.com, quic_devipriy@quicinc.com, conor@kernel.org,
 konrad.dybcio@linaro.org, abel.vesa@linaro.org, davem@davemloft.net,
 mantas@8devices.com, otto.pflueger@abscue.de, quic_wcheng@quicinc.com,
 quic_rgottimu@quicinc.com, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, quic_aiquny@quicinc.com, vkoul@kernel.org,
 quic_sibis@quicinc.com, agross@kernel.org, kuba@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, joro@8bytes.org
Subject: Re: [Linux-stm32] [PATCH 29/47] dt-bindings: net: qcom,
 ethqos: add description for qcs9100
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

On Thu, Jul 04, 2024 at 09:13:59AM +0800, Tengfei Fan wrote:
> 
> 
> On 7/3/2024 11:09 PM, Andrew Halaney wrote:
> > On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> > > Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> > > works with a single interrupt so add minItems to the interrupts property.
> > > The fourth clock's name is different here so change it. Enable relevant
> > > PHY properties. Add the relevant compatibles to the binding document for
> > > snps,dwmac as well.
> > 
> > This description doesn't match what was done in this patch, its what
> > Bart did when he made changes to add the sa8775 changes. Please consider
> > using a blurb indicating that this is the same SoC as sa8775p, just with
> > different firmware strategies or something along those lines?
> 
> I will update this commit message as you suggested.

Hi Andrew, Tengfei

Please trim emails when replying to just the needed context.

Thanks
	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
