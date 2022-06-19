Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F75507B0
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 02:34:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1329C03FE0;
	Sun, 19 Jun 2022 00:34:09 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8A6EC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 00:34:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C75D993;
 Sun, 19 Jun 2022 02:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655598848;
 bh=CJwMmUGuykwFuJQyzvqCXHaGSd5nFKNyUK+sRtc9VGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRZy8PpTEX+A3G3UbOHcNnLYEmY1FD54xuSBX+oXu8FgfxBx13mNxsgty6MEqLXpd
 3Uq5aJ81qlj2YPQnxozIEhLK6uva/mlS66ceLnzVy48VdFKjCzFhhqXW7ZQqKUffZx
 ZONUjfSrFOnUEmuIcDlipqbARxPaENREzCPUQnsw=
Date: Sun, 19 Jun 2022 03:33:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <Yq5u8sPxZoSVKZ7w@pendragon.ideasonboard.com>
References: <20220618222335.478205-1-marex@denx.de>
 <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
 <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Register V4L2 subdev
	nodes
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

On Sun, Jun 19, 2022 at 02:28:55AM +0200, Marek Vasut wrote:
> On 6/19/22 01:20, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
> >> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
> >> the /dev/v4l-subdev* sub-device nodes are not registered and thus
> >> not created. Add the missing call.
> > 
> > This driver configures the subdevs internally. Exposing the subdev nodes
> > to userspace would conflict with driver operation.
> > 
> > If you need the subdev nodes only to query subdev information, you can
> > use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
> > driver to expose subdev nodes to userspace and stop propagating formats
> > internally, but that may break applications :-(
> 
> I need those subdevs to configure e.g. test pattern on the sensor side.

Doesn't the dcmi driver expose the sensor controls on the video node ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
