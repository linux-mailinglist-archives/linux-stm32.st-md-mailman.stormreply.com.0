Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A69051145EA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 18:28:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C519C36B0B;
	Thu,  5 Dec 2019 17:28:53 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65D6AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 17:28:51 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t25so3449307oij.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2019 09:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/xCNgaA/RJUdznExwtslEOtpcNh7qbOa568yutxnWgQ=;
 b=UhIAkV/a/sIHL5Fx8DBJQkYlJQIsSfDba7GhusHn6o8JQbBIAVlzs2nXvLvGXDmON3
 Kdbgli6ZKv5toHd5wLnwfaFJ4ZqtxGWn9y022IyRtlNyZ8RTRcwndz0NxewM4bLo9NEb
 s2uu4/QAjPNpr06EO+d3cX4dqSzEKCiO8fjUkagS436ePmteqK1q+44fQgr+xRNM1lFC
 slImdEGN+V3aC+ZiNYkW8aHI/Cv6Sc9lSUO/rAaQK1cGZHQjRf4XgXhV37kU1e8i/QKB
 QeGBaFBpuCVNShZs6IWCU599FaJp4gabpfFiY0YFA0g1/kYoXgHLWZ/WQ+4Ps5TyQG8u
 LV8A==
X-Gm-Message-State: APjAAAXVy6X20ClhGMsaZoNvSctHZsVcsyWQBgKionvKamasgH3yvIkB
 vbaE8WRZq16skIZZ1Gg3aw==
X-Google-Smtp-Source: APXvYqyo+bOLgmaHpcXxa+Q7K/RJV1JvnSSCEPE3kj2XbGKOEP6yGJkqq8nFO6RkpW4/TBCIdcBFiw==
X-Received: by 2002:aca:3846:: with SMTP id f67mr8052456oia.61.1575566930059; 
 Thu, 05 Dec 2019 09:28:50 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 47sm3645510otf.54.2019.12.05.09.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 09:28:49 -0800 (PST)
Date: Thu, 5 Dec 2019 11:28:48 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20191205172848.GA26517@bogus>
References: <20191125102659.22853-1-amelie.delaunay@st.com>
 <20191125102659.22853-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125102659.22853-2-amelie.delaunay@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: usb: dwc2: add support
 for STM32MP15 SoCs USB OTG HS and FS
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

On Mon, 25 Nov 2019 11:26:58 +0100, Amelie Delaunay wrote:
> Add the specific compatible string for the DWC2 IP found in the STM32MP15
> SoCs.
> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> sensing comparators.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
