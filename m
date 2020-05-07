Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D294F1C95D7
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 18:01:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A3E6C3F95B;
	Thu,  7 May 2020 16:01:46 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45B43C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 16:01:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l25so3000594pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Vq/DlfbSPyVVIVTh/o7/6qUzLWtMfyqE8W9dYn39NuM=;
 b=R8HKj6DxTc0LO9F+Pw7CqV6hlQyRjBt4v65MoFsK1Cmz0TxVccLPJY6pSQooudqnK8
 MnZJ+q1lMvlV5fE9Kt5Z/z92WhK41OVHWalgSZiTk1zNdJprnZZaYFbzloCnu+DhfxHv
 FocM4isWUVHi1F4CTvvIX5z/QOTqq10F5I5IjWWO24scb6Rc9Y5zNaJEJYUKC95c5rDF
 BNoAt+k8LClIZJ7LXnnfbyz86dye0lnXFc9oQQM64jDJzIhNbOT+wdYHR2eLLCLDjCsQ
 H5iZtpS/3kvje1GhQ/Zy4iDv//XIQS7hkBDQmwEkkL03zOW6y4Nfz5OVOQdxQgO/5MWZ
 MFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vq/DlfbSPyVVIVTh/o7/6qUzLWtMfyqE8W9dYn39NuM=;
 b=Xh1BSv4H8fkay5KIpZDbOjGe7Pal++M1GI4pVDbEshIzVfMSHG02MomLpalyzgh9KA
 BZ9triZjUxC2hpN9Nz21/anaj/G313vzidFmac2h0DWqSCuDoJqO0dgzJ7zaZIe4k4XE
 vETcyM6y5Ygx717j1zz1aWxmi8GOcDDY0Qv3Hx/K11FcoOuUFygagvvH3bTHu7tj5Rz9
 FRPpyoAkDWtq2c1Z5cT8nbC5AEaU5/dr7B3dPWw/oUKU82bCKbt2FDTwNY56Cfk0XEzT
 6e3ba+lB9FWPlwx6qJoCQYO6c6Rsyy6a39qyH5gky0veemG9yBA+DfY6jQtSfjiGUUg1
 f9fQ==
X-Gm-Message-State: AGi0PuZoEO/Kea+Gvvp3XFkk/95Wysk6ZVb2urKdvo7dh3dFu/eyhxpF
 hA4Xazc9edmIoG1LUCKTfgA=
X-Google-Smtp-Source: APiQypJmzz+qARIIR1x3MXcG9ZqL0GP+2xbEJLOhPc0Wmm2jy7FnS2cdlbujfCArT3WF9mGSg3GXgw==
X-Received: by 2002:aa7:8b42:: with SMTP id i2mr15117982pfd.21.1588867302441; 
 Thu, 07 May 2020 09:01:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
 by smtp.gmail.com with ESMTPSA id a2sm3984978pgh.57.2020.05.07.09.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 09:01:42 -0700 (PDT)
Date: Thu, 7 May 2020 09:01:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20200507160140.GH89269@dtor-ws>
References: <20200507151213.792640-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507151213.792640-1-hslester96@gmail.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmpe-ts - add missed
	input_unregister_device
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

On Thu, May 07, 2020 at 11:12:13PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in remove.
> Add the missed function call to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
