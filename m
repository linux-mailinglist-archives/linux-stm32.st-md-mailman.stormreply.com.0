Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC69123B2D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 00:57:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF75EC36B0C;
	Tue, 17 Dec 2019 23:57:40 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC985C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 23:57:38 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x3so66996oto.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 15:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E/Jh0gEjrB4l4YoPQEAqdMSsYPuhulVXEcBxp+hlji8=;
 b=Ei1rO25QWIWqdMfk3QHPwrndLZt50smTRT4zKQG5cv573Rr36qPa+tH2lp3rdhqRrM
 4+/jwM1EM4SNyXR5cI5Im9kd3OM6pLDIIHaHuI/bX0zxrKlvbDCqFLu2sN++d3YpM3tA
 fsXYUCDz/mbPRxs8BNEp30MxBeiyppq4ENv835Zhqe6wrPUi7KY4XYpB18bU0PQjqfmx
 0g5LZMC4xxFJaoPZB5/DSpY9c4dn8udARvrt5LWxNZ0cwvQJZvrn2rpjIbU45bOG3SNb
 SkHnnEhQgXG3AXIpwngxCEgdtP/AWuRTEHr6pE+fo8KXUCcCs5btg9sUh+FbMQPYFGyg
 Pn8g==
X-Gm-Message-State: APjAAAUc987DuOgT56XjkPaBcV/DYCdgxHFsc+tpglu0sdJ0Be3ogPEO
 Dc9X0v0gseoCM0dGvaxKDw==
X-Google-Smtp-Source: APXvYqzmn8JDS5mvDHSpuGCBOrZ4cPvFj6ziPOM02alJJJusCEI9xOeuXQl0jITxSGcWJaouCznyQA==
X-Received: by 2002:a05:6830:1bf2:: with SMTP id
 k18mr128163otb.36.1576627057677; 
 Tue, 17 Dec 2019 15:57:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e21sm169865oib.16.2019.12.17.15.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 15:57:37 -0800 (PST)
Date: Tue, 17 Dec 2019 17:57:36 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191217235736.GA17096@bogus>
References: <20191217090715.13334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217090715.13334-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: spi: Convert stm32 spi
 bindings to json-schema
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

On Tue, 17 Dec 2019 10:07:15 +0100, Benjamin Gaignard wrote:
> Convert the STM32 spi binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Erwan Leray <erwan.leray@st.com>
> CC: Fabrice Gasnier <fabrice.gasnier@st.com>
> CC: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> changes in version 2:
> - fix typo in if block (compatible + contains)
>   The boths typos weren't detected by checkpatch.
> - remove type for st,spi-midi-ns property but not add upper limit
>   because the driver compute a delay (expressed in SPI clock cycles periods)
>   from this value (expressed in nanoseconds) and all that depends of the SPI
>   bus clock.
>  .../devicetree/bindings/spi/spi-stm32.txt          |  62 ------------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml      | 105 +++++++++++++++++++++
>  2 files changed, 105 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
