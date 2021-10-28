Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1E43F329
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Oct 2021 01:01:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D757DC5E2C3;
	Thu, 28 Oct 2021 22:51:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 942F3C5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 22:51:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 033EA610C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635461460;
 bh=ydkKoxvRSo6eu745vRa/TLcQSd9m/D2cxCbmCt1U91c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WxbK//MPZtA68/ToRMphU+vkb5/Yfgthv9Jtryg3u2/fAg/A5jVotZxoTfLJNIuWQ
 C7rfnf9zYQ6TLbCi9xUJ40hZAjwD+cU0Q0+3TmQPkq5YAqgf2SPV9u9wA4c+i3Wc51
 lrBGhQOfQIpZXIAwX2JmYjfsOU6lVoTM8OnfoZCVE9Q6UoGpsqUZRqG764a0B0mAHI
 i/0Tn+TnEQ0rTiMB6L9aYzZXUfGI3gMxJ4y6vT82PPocykVgH+SXK4igES6Qs16paK
 5+DMNuBPYihmdw5wXeUd08PNOdCafAPOVqA7Wi4TKkQTFmBkoQsuKRmzmy77mpu5f7
 F7HDfMnvLxIvw==
Received: by mail-ed1-f52.google.com with SMTP id g8so31373034edb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 15:50:59 -0700 (PDT)
X-Gm-Message-State: AOAM531wfs6x06fmckcD9BaPBV+Fy+uvwsHXkFXsUVdqnwOZ0wS83Dxq
 C+DNPMRxntGZtHvIAMb/7+NvWKc+d3Ay0P/KsQ==
X-Google-Smtp-Source: ABdhPJwgX5SnEMO1uWFwKpdNPL1mfAJXywjl8wnll2M9O3paFBcJH0NS1LpQKcFlmeYr12v6w5idAVwktN1A7/eF8/c=
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr8921097ejc.84.1635461458441; 
 Thu, 28 Oct 2021 15:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <1634144026-3326-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YXhnLh9OYxUz8dIC@robh.at.kernel.org>
 <be749cbe-c029-7a24-da0e-94ab363ea07e@foss.st.com>
In-Reply-To: <be749cbe-c029-7a24-da0e-94ab363ea07e@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 Oct 2021 17:50:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJPbJiNi5=YT3siGrb-vu2+Ex6Xa5=XQQ9NR2iMv-3Fxg@mail.gmail.com>
Message-ID: <CAL_JsqJPbJiNi5=YT3siGrb-vu2+Ex6Xa5=XQQ9NR2iMv-3Fxg@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: usb: dwc2: document the port
 when usb-role-switch is used
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

On Wed, Oct 27, 2021 at 7:05 AM Fabrice Gasnier
<fabrice.gasnier@foss.st.com> wrote:
>
> On 10/26/21 10:38 PM, Rob Herring wrote:
> > On Wed, Oct 13, 2021 at 06:53:46PM +0200, Fabrice Gasnier wrote:
> >> Document the "port" property, which is used with "usb-role-switch"
> >> to describe the bus connector.
> >> Definition is inspired from mediatek,mtu3.yaml.
> >>
> >> This fixes some errors seen when running "make dtbs_check":
> >> ... 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>         From schema: ... Documentation/devicetree/bindings/usb/dwc2.yaml
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >> ---
> >>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> >> index 10c7d9b..7d1aa53 100644
> >> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> >> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> >> @@ -130,6 +130,16 @@ properties:
> >>      description: If present indicates that we need to reset the PHY when we
> >>        detect a wakeup. This is due to a hardware errata.
> >>
> >> +  port:
> >> +    description:
> >> +      Any connector to the data bus of this controller should be modelled
> >> +      using the OF graph bindings specified, if the "usb-role-switch"
> >> +      property is used. See graph.txt
> >
> > Drop 'See graph.txt'
> >
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +dependencies:
> >> +  port: [ 'usb-role-switch' ]
> >
> > usb-role-switch without port is valid or both must be present. In case
> > of the latter, you need to add:

If I wasn't clear, that was a question. Is usb-role-switch without
port is valid?

>
> Hi Rob,
>
> Thanks for your review.
> I agree with your statement. But I miss something in this proposal:
>
> >
> > usb-role-switch: [ port ]
>
> I tried this without success, when running dt_binding_check.
>
> For testing, I added locally in the example successively:
>
> 1 - usb-role-switch (alone)
> -----
> +        usb-role-switch;
> "dwc2.example.dt.yaml: usb@101c0000: 'port' is a dependency of
> 'usb-role-switch'
>
> 2 - port without usb-role-switch
> -----
> +        //usb-role-switch;
> +
> +        port {
> +          usb_role_sw: endpoint {
> +            remote-endpoint = <&hs_ep>;
> +          };
> +        };
> dt_binding_check is happy here. But it shouldn't, right ?

You had this?:

dependencies:
  usb-role-switch: [ port ]
  port: [ usb-role-switch ]


If both properties have to be present together, then you need the above.

>
> 3 - both (port + usb-role-switch)
> -----
> dt_binding_check is ok.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
