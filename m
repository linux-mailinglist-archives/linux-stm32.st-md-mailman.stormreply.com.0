Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D890A1054AB
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 15:39:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A33F8C36B0B;
	Thu, 21 Nov 2019 14:39:50 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6646C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 14:39:49 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z25so3107855oti.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 06:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SYYqbOVycEdgZHO+SXnt+K02+QDnVzkJ47TaoH1kdjg=;
 b=MArrGelqRrVbZ8sjsmVW0N3q3ki/NtIRGU4NI0+EPBtpV/ughR39qexSr7eMhbu6TN
 ArtqZP81m6vu0ATy1S3vgw3oenB4IpnvnTUHQJbgkvlY7t0wG1E9NrSSdlAcM83kn29i
 82NrgaT9PHo58kcqftzG64y1gWEymV/KMaDIJcm4hi1K4L9imJQRBHEqQeQh5KptLRYI
 gPwhrnPVJrpBqGZo2OqAcHBvbaINCJiU3IOYpmkxVNjzvk+yLEKh5xD9YLLycgHE2rsp
 zNIosU2h3eP55FZB1xQpKGNqsstJr3JfztJ98QFZQgwsSJPUHWCjQVR4Ks/jh4EubIQd
 H+zQ==
X-Gm-Message-State: APjAAAUxrcMB5HNFPZoP4de4u9HekPPrThKoPOZ++Owy0gJbbFe6VkhY
 AiQB7ptLBOacj+ZjEDwhaw==
X-Google-Smtp-Source: APXvYqwUu/biujtjVLDWyb16pwLG4pruuYMM8CW4+uuGpATDphuBWh04Vk6lWGDYxf1mYwHiGV55vA==
X-Received: by 2002:a9d:b83:: with SMTP id 3mr6529158oth.56.1574347188483;
 Thu, 21 Nov 2019 06:39:48 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y145sm955719oia.21.2019.11.21.06.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 06:39:47 -0800 (PST)
Date: Thu, 21 Nov 2019 08:39:47 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20191121143947.GA25003@bogus>
References: <20191121095102.26693-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121095102.26693-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mailbox: convert
 stm32-ipcc to json-schema
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

On Thu, 21 Nov 2019 10:51:02 +0100, Arnaud Pouliquen wrote:
> Convert the STM32 IPCC bindings to DT schema format using
> json-schema
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/mailbox/st,stm32-ipcc.yaml       | 84 +++++++++++++++++++
>  .../bindings/mailbox/stm32-ipcc.txt           | 47 -----------
>  2 files changed, 84 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
