Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B6197B3C
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 13:52:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE497C36B0B;
	Mon, 30 Mar 2020 11:52:10 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB57C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 11:52:10 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id e7so13895108lfq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUxAOgz8NXHq1Pf5is4saO0kcIUnQRpCo7D1rQX9etA=;
 b=RvTFD7FfX+RF2ea4gaF0j0B2FI534aB0tSVvis0sLeVy4mJcjjSl4QzkrKQxQrs/Lc
 HnSvgz2uPVhL0YBxzkToXX0ETdvrkXkTatxWl5GYZ3Et+xaXK4x9aPAdTDpdFdBHu3LF
 PMXP9o1RYCtkWmFsczRDmvIF/BzwpyQjLk2sSc3ltABf097AdbHhRrcgijhcCicFh6aR
 T0JGsIhIFKx7DyT2mBRoaK6iaHLQKAK+gC/Vv15Z5kpoiAku3KSocHewLR2j8Fd3QtvF
 t0OOgv/I94yviCfCMx7/4Wv5e9qp/KbKw9qXFzvEADHzUn0Nfjrt2u4S0sjQoIEyB6Mz
 8r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUxAOgz8NXHq1Pf5is4saO0kcIUnQRpCo7D1rQX9etA=;
 b=SdLpd3m+bSCLlVB6wtMj2ueTNNr2DZ33aCTnvdT3s7h0bkbprot0jDKhH1lAPRETeF
 AN4rU6fDE1nN4cgz140skjJP7A2EniViqhKoyX5rtZGOqruFsMSd/1o+VRhKIRCS91CK
 ckXsUWwoKYFbkKe57Keu6FyC3GM/td1B1FWPyiOJvn9a8nUOG/SVwv9SbnLdcarLBN+w
 9WOUSbMdCEgvbZq5cHhzZ7/63jZKbNzJOioZcMLKmm/1s+mzLQsROFEnbS+Frmm7NgMa
 pUt897Cz3+tbj0BKMZOz7Qj/YmxUqvu2XVhzBpeFcgQtq5yPVQzHv7s3JTGxPEneCXIf
 Au2A==
X-Gm-Message-State: AGi0PuadLo9SXsOkTuUH/ZmSmKdwINueduIn4MqMdzXkom6wDcZ8RSvV
 JwCYjsLOOnD3HjPo6pTSIqQSuwjxZvrcZsI9eZY=
X-Google-Smtp-Source: APiQypIs6reaMQbUKLAdY3KvxuAlR9R0M+IDM0rH838tBggLkO5g/vojQtpptaZ+TdidZCUDxI0stG9ysPseXJpdgfM=
X-Received: by 2002:a19:4cc3:: with SMTP id z186mr7582516lfa.69.1585569129458; 
 Mon, 30 Mar 2020 04:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-6-adrian.ratiu@collabora.com>
In-Reply-To: <20200330113542.181752-6-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Mar 2020 08:52:00 -0300
Message-ID: <CAOMZO5CKr7hSUFtb9b05rpRtpp9mb9ZyeSVqqiDXvppHJEWu5w@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v5 5/5] dt-bindings: display: add i.MX6
 MIPI DSI host controller doc
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

On Mon, Mar 30, 2020 at 8:35 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:

> +        panel@0 {
> +            compatible = "sharp,ls032b3sx01";
> +            reg = <0>;
> +            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
> +            ports {
> +                port@0 {

There is a unit address here without a corresponding reg property.
This gives warning with 'make dt_binding_check'
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
