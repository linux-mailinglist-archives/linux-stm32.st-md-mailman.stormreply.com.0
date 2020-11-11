Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 605072AF9B4
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Nov 2020 21:26:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B721C3FAE3;
	Wed, 11 Nov 2020 20:26:48 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33271C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 20:26:46 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l36so3398603ota.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 12:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hj4+pw8ddDfVRLtVVhtMI2FMKPhHhrdKPEjjLMu5Maw=;
 b=HEpO1NAdYd6HAdy82lyyyK5A+Yp2SeBr3DpLpzVTHi0WKnZI4cKhwsCFJ6f9zgM5XR
 XCbVojgMuvWaerwQU5KGeLOaqLQbfn/2TQ4UFyA1XDla45RW1wnWx0ADzHD28bxAO1AT
 L6pytsmA0abWRlIxDzXSgIwC+Iy8z3fXeAOcMsv4eUG5C5GL3LwPBhNP1hftpvMFUqyE
 UYbx9YwZiWpqtcqJS516gX9ye5OMZaWHmcAMxPfAL0igz3e21+csQIXTRp3tw4Lmtk/q
 oZaY72KeS30qk1zTITVPj5cEoLfgF5si9vnZ4C8XFyJe5SN8g/Yw4GEohzC4bVF2eWx0
 oFDA==
X-Gm-Message-State: AOAM5303FvdSWrbnicTi6bARHGEUKuW7b1SqRz12nsDP/myr3gl0ZPb7
 WQXjgTrCckgafTlf8tNyHQ==
X-Google-Smtp-Source: ABdhPJxr4q2zIpY09NpELS89LQibqWQjpbSRdmMZh63473nOtuxnOzgW3Rb86xN0M0DADa2i2F92QQ==
X-Received: by 2002:a9d:75d6:: with SMTP id c22mr6031778otl.350.1605126404918; 
 Wed, 11 Nov 2020 12:26:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x190sm638931oia.35.2020.11.11.12.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:26:44 -0800 (PST)
Received: (nullmailer pid 1971079 invoked by uid 1000);
 Wed, 11 Nov 2020 20:26:42 -0000
Date: Wed, 11 Nov 2020 14:26:42 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201111202642.GA1971049@bogus>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-3-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106165805.31534-3-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>, Rob Herring <robh+dt@kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/5] dt-bindings: usb: Add DT bindings
 for STUSB160x Type-C controller
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

On Fri, 06 Nov 2020 17:58:02 +0100, Amelie Delaunay wrote:
> Add binding documentation for the STMicroelectronics STUSB160x Type-C port
> controller.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/usb/st,stusb160x.yaml | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
