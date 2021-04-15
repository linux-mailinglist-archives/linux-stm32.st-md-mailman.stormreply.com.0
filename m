Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DE3613F2
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 23:12:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C784C57B79;
	Thu, 15 Apr 2021 21:12:49 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CBC0C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 21:12:47 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so23875814otk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JQ2Zv9KN+sFtm5hgoZ4mlRTwKbTrKF/NDQ8a3eP11BA=;
 b=svizmIi/XQqm4ASWXRaO3Gxz2vQiNJ9HKbw0aMHwIBRxqlFUHqCOu9pAZO6fWYEmGZ
 R8qCTknG7UM/TW+/2vw7a6ywqjRageI0kTK0TY3N2YV/GLk0VICcpJ9xGyO8vc3v9Zwl
 qUs3fu2W03/X9PLaFuRzva54Odn65GWVfm28otn187JXIc5hkoOQt5vz0t0R6IbZyKA9
 gpyyl8zYI8Rdd9EHYMcuT+ebSQdhcuhy4l6XFZUl024RJ3lC/mYW70KtjuRJ8J+2eDyF
 Ps7YcnCYP2iv3NvnK6RCosq6kGmagrQJdmL50WzNx8IUi47MHlxpI6/IcBhn9v3+fsnE
 fOUQ==
X-Gm-Message-State: AOAM532XVFHpGOCKRFGWHRkEbvKgBORiuq/SQzDXmOJYiy5tOt8fNltH
 YiarocU+AG6XPzp3hn6M6g==
X-Google-Smtp-Source: ABdhPJwQtuI68Yw0PKHkGhf6QScMLr5HtMsvZBmENUaHcyxdAy6/E/akiOKRdGyzo/1qXRBt+dzd0Q==
X-Received: by 2002:a05:6830:1045:: with SMTP id
 b5mr945582otp.257.1618521166394; 
 Thu, 15 Apr 2021 14:12:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w7sm881135ote.52.2021.04.15.14.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 14:12:45 -0700 (PDT)
Received: (nullmailer pid 1891337 invoked by uid 1000);
 Thu, 15 Apr 2021 21:12:44 -0000
Date: Thu, 15 Apr 2021 16:12:44 -0500
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <20210415211244.GA1891289@robh.at.kernel.org>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
 <20210413174015.23011-2-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413174015.23011-2-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: serial: add RX and TX
	FIFO properties
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

On Tue, 13 Apr 2021 19:40:12 +0200, Erwan Le Ray wrote:
> Add two optional DT properties to configure RX and TX FIFO thresholds:
> - rx-threshold
> - tx-threshold
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
