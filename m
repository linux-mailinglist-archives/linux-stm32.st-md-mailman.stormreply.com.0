Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F15586952
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D364FC6410C;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23983C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 15:32:44 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id e132so13445788pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QvgqOJsJaRfwh288RK8fy30Wkh0J6u/9f1tN/TUOFVA=;
 b=NrQhRCOMUDC3mXJXosstgVwIDMYkidDR0/Q8Vw6uHokuZZDKRNeVGoywXSjWMLsSAi
 BqPLLK53Unp4zoisknrJ5o424bakXSL2cC8jAQsP2Der1v23+fwmcypMhH9PEbm7r3Wz
 wZUq758ylpkk1JsIjod8XkkgxvaCtL8hlO5xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QvgqOJsJaRfwh288RK8fy30Wkh0J6u/9f1tN/TUOFVA=;
 b=bcexAz0CTUKw9N5nkCEKBQ3DyU4eAHHutsEwCm6UmMkbx/F6KD+1PFDAjgXcYixXXV
 +pBKUfkkzq8OcKww0BPPK5brRd5QekIRs/aTEQzAc4AvxtZoxTbn8WuKnJ/04nfV1vG/
 +cOOwjylpqqMoJwiNyK98G0YWEFSAuAkL5LH+zI4S4UreryZAM/RzbhtvCBG/qAVtPid
 0d6dB2vI7FcEwyj3GPohPGBNjbj/rtTEfuvNXFhYcYKKMAVep1xqCBrKnTxsYVO3MJ62
 tLxJq9/FKSN1Ij+0WDK7AgQEzBkd2K317bQXfxWqJnm8MOvHEnnZ142Uv29VLknuYmKH
 122g==
X-Gm-Message-State: AJIora/zmWbvYzEeAla7Xugks7q7nrwOp4hT4g7kyiWh3NJNzcQRtkHL
 tQKnMfgTwjYxqNr1N9/gzbHI1g==
X-Google-Smtp-Source: AGRyM1s00puXzuack0g772HA7Y+ZUTEclrQEjeyTAfQzTXf+aMs/JSmo14i4PletDJvEYqkYsRojGQ==
X-Received: by 2002:a65:6e96:0:b0:415:5973:b4f4 with SMTP id
 bm22-20020a656e96000000b004155973b4f4mr14939446pgb.568.1658849562682; 
 Tue, 26 Jul 2022 08:32:42 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e9b1:f865:ec5d:495e])
 by smtp.gmail.com with UTF8SMTPSA id
 ne16-20020a17090b375000b001f3009a5ccfsm564197pjb.54.2022.07.26.08.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 08:32:42 -0700 (PDT)
Date: Tue, 26 Jul 2022 08:32:40 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YuAJGBmX3Bf5Y1qf@google.com>
References: <20220726080708.162547-1-fabrice.gasnier@foss.st.com>
 <20220726080708.162547-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726080708.162547-3-fabrice.gasnier@foss.st.com>
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:11 +0000
Cc: devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] usb: misc: onboard-hub: add
 support for Microchip USB2514B USB 2.0 hub
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

On Tue, Jul 26, 2022 at 10:07:06AM +0200, Fabrice Gasnier wrote:
> Add support for Microchip USB2514B USB 2.0 hub to the onboard usb hub
> driver. Adopt the generic usb-device compatible ("usbVID,PID").
> Some STM32MP1 boards have this hub on-board, with a supply that needs to
> be enabled for proper operation.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
