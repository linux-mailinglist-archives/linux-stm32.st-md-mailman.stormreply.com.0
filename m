Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC7128543
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2019 23:54:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B00DC36B0C;
	Fri, 20 Dec 2019 22:54:52 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9521C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2019 22:54:50 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t26so10967395ioi.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2019 14:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N6aXh/oY7lMy+cARmMvGPpZJvUooMcIfU6lzBw92zjc=;
 b=YB3bEcYPuen6m3hHtlWrSR2fu9iebpIcPbLZ5FUSb3OdZtRfl8b6Jsb9NDvENhUNFM
 9GnvswDWlHj21fP6T+K/Z0Lf1jTqSuOh5I6VpErmsDjw19cK2uyV8e73Qhp6yc5s0+aQ
 OaPeSL5+Gr/eYXOyxPJcJsqAoX1l4A+4btP0WGSQ40CHIik6ghzWrTSGRC3Mdr3iRx71
 A6y3K95l9qfbM2/qJdZU1ucNuShLydpb7pnmQGusXuYQwnbWuE1MYw3iy0qu6ngfSg5G
 8A9v89vTGHivzk95cHfJQrK6si+lVmqt7dDbb3GRgLhWK+JcqXvXC2iYt/HM14vGp52Z
 2wtQ==
X-Gm-Message-State: APjAAAU48XchMtM8H7n23G70OjbbCNnvcmP6A4Ad6qxgdUT+Gj+iDLSq
 QqouLH430xyhu2q5b+Lejw==
X-Google-Smtp-Source: APXvYqxRHv3mavUCCTrXPMpUhFxucuGGurQ6Fm6MRXBtA0U0dF6vAMO9RsEqh8V50CJdUZic7aVDsg==
X-Received: by 2002:a02:8817:: with SMTP id r23mr14536778jai.120.1576882489464; 
 Fri, 20 Dec 2019 14:54:49 -0800 (PST)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z15sm5471450ill.20.2019.12.20.14.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 14:54:48 -0800 (PST)
Date: Fri, 20 Dec 2019 15:54:48 -0700
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191220225448.GA5275@bogus>
References: <20191219144117.21527-1-benjamin.gaignard@st.com>
 <20191219144117.21527-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219144117.21527-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: nvmem: Convert STM32
 ROMEM to json-schema
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

On Thu, 19 Dec 2019 15:41:15 +0100, Benjamin Gaignard wrote:
> Convert the STM32 ROMEM binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ---------------
>  .../devicetree/bindings/nvmem/st,stm32-romem.yaml  | 46 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
