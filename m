Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C7D6835
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 19:18:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48AB8C36B0B;
	Mon, 14 Oct 2019 17:18:28 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68658C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:18:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a15so14407449oic.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 10:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=woBF22Zo3gSgEXnFBjrpZBAJnkenQ3ulqN1pWDAJfBI=;
 b=rarqw1TrCfAwwxCsNhhMIJYjyGik4Vum8cwRLlXHAx1RSynzYfSrPRiOh0akCw9hah
 NfW+3clI9K8G03MZ29JOmZbbV5HmJkVxFQRwx2YMzbtUVKL3EFEsolbq6DcvO4Q20yrZ
 8x6gAOAzrkcbjDNxeqUymaElFFXQvvBkGZN8Dvn1O5e+uzluP86CHWSas8GPwsYPy2Eu
 vDn+Ci+OpzwivnzVDnAR9GiPYjbMKKaUhpUNUi6E4hFmIEdGou5vr+0Rl56wo/+0/4g5
 ePFa3BpuBIg9GUZTu4Vo+06Ehy1xwSmeiPEUG/fPXrGThto6aT47XOphz7YAWk50PVOM
 lfqg==
X-Gm-Message-State: APjAAAVBBrLAy1uSMWgkUpacB7KsR3VzWzEpAHrBGv2KEPb/voUIwR2I
 HV95GmZl0eDtDaUKxCBk7A==
X-Google-Smtp-Source: APXvYqyr/1vK3/H8M3hQGrLJtcS3+95Pa3jcICVvxpRAUDlmEdNi7d5eXvtMuY3v1sivDQUgc/Dw4w==
X-Received: by 2002:aca:4994:: with SMTP id w142mr25900821oia.88.1571073505046; 
 Mon, 14 Oct 2019 10:18:25 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v6sm5638740oie.4.2019.10.14.10.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:18:24 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:18:22 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191014171822.GA7421@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
 <20191014092021.24020-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yannick.fertre@st.com, robh+dt@kernel.org,
 mchehab@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: media: Convert stm32 dcmi
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

On Mon, 14 Oct 2019 11:20:21 +0200, Benjamin Gaignard wrote:
> Convert the STM32 dcmi binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> -use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - remove useless dma descriptions
> - fix clock property
> - add additionalProperties: false
> - fix reset indentation
> 
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 -----------
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 86 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
