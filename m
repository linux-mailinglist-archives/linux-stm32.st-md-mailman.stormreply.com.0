Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CD198811
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 01:20:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79B2BC36B0B;
	Mon, 30 Mar 2020 23:20:45 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E21B5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:20:43 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t6so14027658ilj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 16:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RBOl7Iekk96c/AIshrO/3RWqL8uoE2wDrX33YLwOSfA=;
 b=W6WLOONu4rIOXT2tlh11RjIxJe1Mk6rwwkc34zURH2I9a2i80qXD5kBtxeFDkMggmU
 DM3eBNuvqyftJTpVZCb7tdi1HRh+hRW1D60vt+kuVfATog+AUyMoEs/btQLOcs3wNdGf
 MxbADUKCo1Ljq11vQxRhonspeDUFc5U9QH1vbdcY5BpuvzQVGo2iDoj7rQKinmMvCtZd
 hicHtaKioq1f1h/QJJa6zieT8LSZVojuD1u3QdD9c3ldOcKjhiJGncOUKWE9xcsEt5EB
 EjzHUP5IIs2tN8KA+UF0OPWNnCKq6p7T7R9RrEHLA8GxUhTggpXUx4mKsEbYuDsfhm/j
 kh3A==
X-Gm-Message-State: ANhLgQ1ose4Ulux3jT/1kNY4lUNw9JJ+cMhZX8Bs3/f1MNA7CXJFAP6Z
 xIuFSHo/MFY4/qA/KOoKjw==
X-Google-Smtp-Source: ADFU+vuWSuZ4f9YO6jw06I9AgPXOM3ftiwikw3P3ryqZHCbuD8iOLBgqAHDz4IGWRDg4StG2CP/baQ==
X-Received: by 2002:a92:91c3:: with SMTP id e64mr6471514ill.68.1585610442647; 
 Mon, 30 Mar 2020 16:20:42 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s25sm5336349ilb.37.2020.03.30.16.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:20:41 -0700 (PDT)
Received: (nullmailer pid 16658 invoked by uid 1000);
 Mon, 30 Mar 2020 23:20:40 -0000
Date: Mon, 30 Mar 2020 17:20:40 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200330232040.GA16570@bogus>
References: <1584639983-31098-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584639983-31098-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: iio: dac: stm32-dac:
 convert bindings to json-schema
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

On Thu, 19 Mar 2020 18:46:23 +0100, Fabrice Gasnier wrote:
> Convert the STM32 DAC binding to DT schema format using json-schema
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in v2:
> - Fix id relative path/filename as detected by Rob's bot
> ---
>  .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  63 ------------
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 110 +++++++++++++++++++++
>  2 files changed, 110 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
