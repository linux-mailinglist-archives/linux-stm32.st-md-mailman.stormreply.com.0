Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E8105A73
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 20:37:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DBC9C36B0B;
	Thu, 21 Nov 2019 19:37:48 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7476CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 19:37:46 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l20so4277322oie.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 11:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tMER4MOHixp2wY9ZjS4RrN2RrDNX7H+o1z/zXkM48ZU=;
 b=QHEnP0YZY1pQDhOymWgj39uzrz2FmlkeJfCvbmYCL1i6pKMXfD3S2qlthcgcpnohZl
 aNrrSdALiZy65DaVQiScszOlBOFk78ofcJiQ2O0EQptECt/gw0AoOgAhODGl5yItBpVK
 2vJyO2xb/pDTNLg818KY/Mw6P9vkiryPxzCNKwbJeIJ7JsG7yX9rOrVg8f7MTCFFbsf6
 /7RwaxmsLQqGyumbRXtcxy/iW9VrHtEwziNKZa44akabFm+LTkW/Kf8F6OI7CKUfJCo9
 Mx2UJT5oaBCp0ZKnYc41xgYZv4YQ0tVq7vFbytB1F0/cNs8QRgEUjfDWoF3f/FwSQyrX
 217w==
X-Gm-Message-State: APjAAAUXouOPWtiHVn+EHzL7XGZDWrbFpJE47yFCztTC14QmCdS/GRQ6
 1s1m+sJyw9ZRQb9/w9Uwxg==
X-Google-Smtp-Source: APXvYqxz3r1XfhG46Xqzohy//cfJAs84lDW7vsquvPUXB2FPHrRH/1ETgZRryOu7acvqdws+X02tgA==
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr8823046oia.148.1574365065094; 
 Thu, 21 Nov 2019 11:37:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e88sm1305777ote.39.2019.11.21.11.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 11:37:44 -0800 (PST)
Date: Thu, 21 Nov 2019 13:37:43 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191121193743.GA3627@bogus>
References: <20191121130615.13007-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121130615.13007-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mtd: Convert stm32 fmc2-nand
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

On Thu, 21 Nov 2019 14:06:15 +0100, Benjamin Gaignard wrote:
> Convert the STM32 fmc2-nand binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 --------------
>  2 files changed, 98 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
