Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C7473754
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 23:16:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B11AC5EC76;
	Mon, 13 Dec 2021 22:16:55 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44F0DC5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 22:16:53 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m6so25068088oim.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 14:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+jBPFWLatnriXFCvj3w344POA1/0vKxUfWpn0sfzvfE=;
 b=tpThkoNQjakSk9vzyobNMMYIAgSt67PAi+d4DmeYjVARrMHTys+fuh0AVW1UZVIOAE
 fAGrWgqII/yqH/vVPGrOvw5+DfwhxLjJ4R+aZ5S8BpDhAV2r+UZ4BPV2k8abNiB/GMMa
 M1k3LS+eYV4nE8ZCOFB8OakhgYiwLxyHQCrY2oqOKY8zZIpZ51rlhf2P4HKAzCpdh9r3
 BrAh4nRqea5Bv1tl95m4yU/8Qavw3JGa2XFXB3Ntahmq/Yf85kwkMVHNhC7Dz5R2TNy9
 Fr7wNRNmC8eup9y5tSMRVtp0yd8GObERe7gweedCm8f4+MMOuiPIjC12hkh23UHn3AAe
 7KVg==
X-Gm-Message-State: AOAM532rS3I8jkKBrsKoRC9iht08ga2H7yHevFYU6qk/KSkH/C757h87
 5Br/XDUtks1pykRUNDm40w==
X-Google-Smtp-Source: ABdhPJyWPNiljtqQ49VPuUiFYMtAr9XnIX7dCsGeyJyUvJqziPIIDVs9bziDMydJLRfH6lh99DUbrw==
X-Received: by 2002:a05:6808:14ce:: with SMTP id
 f14mr29240216oiw.162.1639433812044; 
 Mon, 13 Dec 2021 14:16:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r26sm2377051otn.15.2021.12.13.14.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 14:16:51 -0800 (PST)
Received: (nullmailer pid 1676039 invoked by uid 1000);
 Mon, 13 Dec 2021 22:16:50 -0000
Date: Mon, 13 Dec 2021 16:16:50 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YbfGUrn/fFN2RSmi@robh.at.kernel.org>
References: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1638806203-6624-2-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638806203-6624-2-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: usb: document
 role-switch-default-mode property in dwc2
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

On Mon, 06 Dec 2021 16:56:41 +0100, Fabrice Gasnier wrote:
> role-switch-default-mode property may be used with usb-role-switch
> property to define the default operation mode (by forcing the a-valid or
> b-valid) at init.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
