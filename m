Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E96B9AAD
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 17:08:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 719E8C65E60;
	Tue, 14 Mar 2023 16:08:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18A3EC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678810107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ye+Zs2ZnlofuAeakJPo0MMXWynO6qrZaDf6LrDdzxr0=;
 b=ejwrMlFsx1TxgmmnRNZhp3+NMS3Xr5MoIU7OzdUMwnWM4XLbnfPLFFJGDLg0YuDIn/2wBU
 vYwsjMc76wYFtmLwoBEcfF7bWYK4TsPUiitBCW0LNyxzoAtJZYuwfNPv053qToMq7bw0WG
 qRIuEu8hnmiV7jgmnmyMrUqG09lyJhg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-JaAIAYpDPSG5o9lchyF3OQ-1; Tue, 14 Mar 2023 12:08:23 -0400
X-MC-Unique: JaAIAYpDPSG5o9lchyF3OQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 px10-20020a056214050a00b005ab138d7672so2353134qvb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678810103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ye+Zs2ZnlofuAeakJPo0MMXWynO6qrZaDf6LrDdzxr0=;
 b=VpCH5d6GKFuBK2tAz/VlP46LuQD6JjEVgLs77+pJGsO5SNAUwIaVNvYu8Wfx8ItA4j
 U2+IASi2Cy4Oo9M9DQxQQEgyRSbBFHWYCmZVOA2HuTYpJTiXbSBUtC7Sw/AEbKpwd5Wm
 NKzC31KbI59EmOs6lf4WOzVw56BOIeL2Ex3fynRzO7UdR5BoDkgUDy7mT1zlNGFZDka8
 6wDHM945Yji28YfEac80ARaIDJCpm9qZ/mhfhAvRgAXUFmWZPtofffzMifZjmh6zWRBE
 aX7CsrSURaSxXeTazjdYqMSDTjrRk6ViuqKxFIxynGDtAdX3T1uRi6y9zNE51ayjAZ5/
 ypMw==
X-Gm-Message-State: AO0yUKXBAH2XOGlK0zPynrhFD+l46wpzYgEp3H1QuGArXpqLKJLA+ECx
 hNWSSOhQAHqquNbkyhqLm414FH0t+N36NkK4tZyHE2C3XbxbQz06G2S8nswQnIHwaubL0sEbwac
 gGjOz3GhsfOf/3URgbGextRrLA3U3Jn8pKHSnvvyD
X-Received: by 2002:a05:622a:134b:b0:3b6:3260:fa1d with SMTP id
 w11-20020a05622a134b00b003b63260fa1dmr63289007qtk.45.1678810102797; 
 Tue, 14 Mar 2023 09:08:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set8+Q/YIESpi+tpsA8aTC6oiVaMszVdOh9hZlBEg5fft+wCfZpLbUpRbaWQbPDeCDDmvmA+rsw==
X-Received: by 2002:a05:622a:134b:b0:3b6:3260:fa1d with SMTP id
 w11-20020a05622a134b00b003b63260fa1dmr63288928qtk.45.1678810102361; 
 Tue, 14 Mar 2023 09:08:22 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 s81-20020a374554000000b007426b917031sm1989714qka.121.2023.03.14.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:08:21 -0700 (PDT)
Date: Tue, 14 Mar 2023 11:08:18 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp:
	Add EMAC GDSCs
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

On Tue, Mar 14, 2023 at 04:13:18PM +0100, Konrad Dybcio wrote:
> 
> 
> On 13.03.2023 17:56, Andrew Halaney wrote:
> > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> Was it tested to not cause issues on access on "normal" 8280xp?
> AFAICS if there would be any, they would happen at registration
> time, as gdsc_init already accesses its registers

No, I've only tested this series on the sa8540p-ride. I luckily also am
working from an x13s, I will use that to confirm nothing strange happens
with this applied before sending v2 and confirm the results.

Thanks for the idea,
Andrew

> 
> Konrad
> >  drivers/clk/qcom/gcc-sc8280xp.c               | 18 ++++++++++++++++++
> >  include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  2 ++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> > index b3198784e1c3..04a99dbaa57e 100644
> > --- a/drivers/clk/qcom/gcc-sc8280xp.c
> > +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> > @@ -6873,6 +6873,22 @@ static struct gdsc usb30_sec_gdsc = {
> >  	.pwrsts = PWRSTS_RET_ON,
> >  };
> >  
> > +static struct gdsc emac_0_gdsc = {
> > +	.gdscr = 0xaa004,
> > +	.pd = {
> > +		.name = "emac_0_gdsc",
> > +	},
> > +	.pwrsts = PWRSTS_OFF_ON,
> > +};
> > +
> > +static struct gdsc emac_1_gdsc = {
> > +	.gdscr = 0xba004,
> > +	.pd = {
> > +		.name = "emac_1_gdsc",
> > +	},
> > +	.pwrsts = PWRSTS_OFF_ON,
> > +};
> > +
> >  static struct clk_regmap *gcc_sc8280xp_clocks[] = {
> >  	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
> >  	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
> > @@ -7351,6 +7367,8 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
> >  	[USB30_MP_GDSC] = &usb30_mp_gdsc,
> >  	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
> >  	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
> > +	[EMAC_0_GDSC] = &emac_0_gdsc,
> > +	[EMAC_1_GDSC] = &emac_1_gdsc,
> >  };
> >  
> >  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> > diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> > index cb2fb638825c..721105ea4fad 100644
> > --- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> > +++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> > @@ -492,5 +492,7 @@
> >  #define USB30_MP_GDSC					9
> >  #define USB30_PRIM_GDSC					10
> >  #define USB30_SEC_GDSC					11
> > +#define EMAC_0_GDSC					12
> > +#define EMAC_1_GDSC					13
> >  
> >  #endif
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
