Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7AE5507AD
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 02:28:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE69C03FE0;
	Sun, 19 Jun 2022 00:28:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D056FC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 00:28:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E05C584011;
 Sun, 19 Jun 2022 02:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655598536;
 bh=L688duDzXEa9xnbGTBtYRkLTDrVbLjKIzgi9IUpo/50=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gGDtv0wrkJpCBoI1CxxeJOjlRL/KLImh+O5LD/I1UuOBktvyHSElbefENKoWF+amw
 SMAHvbSQ2EkwpqDZrb5lq0lYWe8JFHfLlx7Zb7CQ/w+Ybg97b96JUQIyU682DNMAZ9
 asqNrvIwUb57JhPc00On6b3IAzCXGFRLdIYoxfQy1g3IPDrXvYPc8dfehniGSi05RC
 aOeoZ8hX+/Y/Zsn91jA+hwASwnkCl9Sbn9YOddsdFOI63zNnHm2j/ESlN/G8DZduOp
 YrrN+M977z1C6My9KYhNnXOAp2OcuGJtwSnq7CwyLuzHdPof164vIQG7K/bpCGkEY8
 8BnXxMfg6dSyA==
Message-ID: <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
Date: Sun, 19 Jun 2022 02:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220618222335.478205-1-marex@denx.de>
 <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/19/22 01:20, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
>> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
>> the /dev/v4l-subdev* sub-device nodes are not registered and thus
>> not created. Add the missing call.
> 
> This driver configures the subdevs internally. Exposing the subdev nodes
> to userspace would conflict with driver operation.
> 
> If you need the subdev nodes only to query subdev information, you can
> use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
> driver to expose subdev nodes to userspace and stop propagating formats
> internally, but that may break applications :-(

I need those subdevs to configure e.g. test pattern on the sensor side.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
