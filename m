Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02D5A1224
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 15:30:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0A22C6410A;
	Thu, 25 Aug 2022 13:30:22 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E08FC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 13:30:21 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P6MixA004380;
 Thu, 25 Aug 2022 08:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=gJwGJFOg+PHJxQ8GqbYk+5x4TFGmNBMycRNhoucedzk=;
 b=dOsfC2wk+NU/FTwxvM+o+MtI+cRTYtIl7fNr+UKOqHpdjYsklEgJFYb1uYciDDXGH6nN
 NyIZeYrogjNXqTE6CKdPKtSvHYkGYY14DXr6VXHIFV/OufVxEVY2UM+q7QcKkgXxyHlo
 ioEUtAmWpOqDzw1gg+n6AQLdXvEDLZnNxb++2gdEoXtSZtLecuT8JT2QYcSoSYCAlRbV
 92trEPxPVQitk4PiZBknHGFrBFQKU2+rh9uyb6YBErw2Zpa9W8tMS/515/9eMKVQAwId
 rRy4Mvfs4aBKFEEK59HutkLBtc0Tfvpk0Sr980Gk7blSvvt0LsK+d52gUo8opnSrTcmd sQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3j5a3ra2a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 08:29:41 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 08:29:39 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 08:29:39 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 13DC3B0E;
 Thu, 25 Aug 2022 13:29:39 +0000 (UTC)
Date: Thu, 25 Aug 2022 13:29:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20220825132939.GO92394@ediswmail.ad.cirrus.com>
References: <20220823145649.3118479-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: sT2u7Xs6q1g-zrXUkym3ve5E5LQDcjOO
X-Proofpoint-ORIG-GUID: sT2u7Xs6q1g-zrXUkym3ve5E5LQDcjOO
X-Proofpoint-Spam-Reason: safe
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Renner Berthing <kernel@esmil.dk>, Samuel Holland <samuel@sholland.org>,
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Robert Jones <rjones@gateworks.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Steve Twiss <stwiss.opensource@diasemi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
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

On Tue, Aug 23, 2022 at 09:56:35AM -0500, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
