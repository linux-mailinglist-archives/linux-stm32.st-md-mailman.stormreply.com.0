Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326C35F672
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 16:46:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B24EC57B78;
	Wed, 14 Apr 2021 14:46:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F11C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 14:46:51 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id u7so8424803plr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y3YNr7aga5ARelEpZRoG5kXAVCwy+EfMKJ2wZNKrO3k=;
 b=ML7MiXkg3x7j3dPBKlrJ7xBHHkyhcHhmiaxYaU3LP1/NqUTiDaZBe2nNTkMu2xYXB8
 07DEYWLN89VBdlJlZ1U45qTNI8zGXm4GNPHLrX/9Zdn+HGB0cVS87jjL16NHQgEiyUWi
 LSUBLSFSTWnPL+wk0DjZvz4ue/VV9SBje41l44Vh1Z61PHjkTfbxD7iOEgA1JPxq1bfV
 gvGP+C+LGUcSAwdsWcLOp8TtOyo0YeIBCuhTTjIBzeQxe0i+B15u0Agc6EyxWTt3Wp4g
 penu+1PFSffsZGCSD9igYEXSSrpMH1Lje0MYdqEVhX7h5vY6StZr83+DjrLm2ZKCB27H
 RMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y3YNr7aga5ARelEpZRoG5kXAVCwy+EfMKJ2wZNKrO3k=;
 b=XOVggY3TSV9HzYgtr2bYhJvo8QBv0R3iWZ6K2xJfonNBQeQGUz/3pO7fByPUYh/dac
 J7FXyLFfTSVOsaZERRurG9COcRr9bCAV3Cr1a2IV+VsMjNxX603EH8xyeOa5nrAUMhd7
 UffpVE6SsfSlJM20DVUBZqfb7lkSR3SjSpGM0I2b01hBtNMmHOKaH4vwk0uh1B5pwM7S
 BBSCboBz18rThz1WyEQhnDiDRO/a+gqvI/fhM6l6vqrEhLrcbahJnmEwQx2oOu0RqxW5
 uh17EanJ+vPk72tdrsP601SpemuzBxQmFSLMy561iucfKybu4skCSBqV35w7H3mzOXl+
 VA0w==
X-Gm-Message-State: AOAM532hcufJXIUpQx3jdN5mKmR5fstYEMPRW/+ZeoDm1+mIdIRBMlOH
 SXNm9qsIcD1Z6C+4bWSnA/M=
X-Google-Smtp-Source: ABdhPJxKK5K0A+ptCC6cs4HU1E95eLmtfVt+UNTJ9KhISNjDs3CWHt/5dPOuBfs//BQ59rrQGaAc7g==
X-Received: by 2002:a17:90a:ff07:: with SMTP id
 ce7mr3956535pjb.0.1618411610372; 
 Wed, 14 Apr 2021 07:46:50 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:645:c000:35:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id s17sm4879049pjn.44.2021.04.14.07.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 07:46:49 -0700 (PDT)
Date: Wed, 14 Apr 2021 07:46:47 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <20210414144647.GA9318@hoboy.vegasvil.org>
References: <20210414001617.3490-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414001617.3490-1-vee.khee.wong@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/1] net: stmmac: Add support
 for external trigger timestamping
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

On Wed, Apr 14, 2021 at 08:16:17AM +0800, Wong Vee Khee wrote:
> From: Tan Tee Min <tee.min.tan@intel.com>
> 
> The Synopsis MAC controller supports auxiliary snapshot feature that
> allows user to store a snapshot of the system time based on an external
> event.
> 
> This patch add supports to the above mentioned feature. Users will be
> able to triggered capturing the time snapshot from user-space using
> application such as testptp or any other applications that uses the
> PTP_EXTTS_REQUEST ioctl request.
> 
> Cc: Richard Cochran <richardcochran@gmail.com>
> Signed-off-by: Tan Tee Min <tee.min.tan@intel.com>
> Co-developed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>

Acked-by: Richard Cochran <richardcochran@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
