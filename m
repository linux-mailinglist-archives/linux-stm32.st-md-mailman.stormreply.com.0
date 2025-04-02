Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660FA78A82
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 11:01:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 138E2C78012;
	Wed,  2 Apr 2025 09:01:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E789C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Apr 2025 09:01:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FA6612FC;
 Wed,  2 Apr 2025 02:01:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937A73F694;
 Wed,  2 Apr 2025 02:01:51 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:01:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Message-ID: <20250402090147.GF115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
 <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
Cc: Rob Herring <robh@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 9/9] coresight: Consolidate clock
	enabling
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Jie,

[ + Rob ]

On Wed, Apr 02, 2025 at 08:55:51AM +0800, Jie Gan wrote:

[...]

> > > =A0 {
> > > -=A0=A0=A0 struct clk *pclk =3D NULL;
> > > +=A0=A0=A0 WARN_ON(!pclk);
> > > =A0=A0=A0=A0=A0 if (!dev_is_amba(dev)) {
> > > -=A0=A0=A0=A0=A0=A0=A0 pclk =3D devm_clk_get_enabled(dev, "apb_pclk");
> > > -=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(pclk))
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk =3D devm_clk_get_enabled(dev,=
 "apb");
> > > +=A0=A0=A0=A0=A0=A0=A0 *pclk =3D devm_clk_get_enabled(dev, "apb_pclk"=
);
> > > +=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(*pclk))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *pclk =3D devm_clk_get_enabled(dev=
, "apb");
> > > +=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(*pclk))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(*pclk);
> > > +=A0=A0=A0 } else {
> > > +=A0=A0=A0=A0=A0=A0=A0 /* Don't enable pclk for an AMBA device */
> > > +=A0=A0=A0=A0=A0=A0=A0 *pclk =3D NULL;
> > =

> > Now the "apb" clock won't be enabled for amba devices. I'm assuming
> > that's fine if the clock was always called "apb_pclk" for them, but the
> > commit that added the new clock name didn't specify any special casing
> > either.
> > =

> > Can we have a comment that says it's deliberate? But the more I think
> > about it the more I'm confused why CTCU needed a different clock name to
> > be defined, when all the other Coresight devices use "apb_pclk".
> =

> Hi James,
> =

> The original clock-name for CTCU is apb_pclk, but the dt-binding maintain=
er
> request me to change it to apb, that's why the clock name is different fr=
om
> others.
> =

> I am not why we need apb instead of apb_pclk in dt-binding. Maybe some ru=
les
> have changed for dt-binding requirement.

My conclusion is that if a device is an Arm Primecell peripheral, it
should use the clock name "apb_pclk" (See the DT binding doc [1]).

CTCU is not an Arm Primecell peripheral, so it does not need to strictly
follow up the clock naming for Primecell peripheral.

In Arm CoreSight framework, for code consistency, I would suggest
using the clock naming "apb_pclk" for the APB clock for a newly added
device that even it is not a Primecell peripheral.

(We don't need to make any change to the CTCU driver, as we need to
remain compatible with existed DTB blobs).

Cc'ing Rob in case he has any suggestions.

Thanks,
Leo

[1] Documentation/devicetree/bindings/arm/primecell.yaml
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
