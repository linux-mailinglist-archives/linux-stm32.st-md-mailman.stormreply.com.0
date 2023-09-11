Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33079A49E
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 09:36:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21106C6B46E;
	Mon, 11 Sep 2023 07:36:18 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35185C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 07:36:17 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-52a250aa012so5366492a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 00:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694417776; x=1695022576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E++QcmaSCqRTogZf0py8lxCDiY1aiEIVkjD7gfQ6xAc=;
 b=SvfNvOh81ph1C6JvI4BC7exQjBs2TfMKrzDZUcNFOVQLOiL6zZV0axDOCMewHwNPt5
 rOLgikiUzdsDj2/3yUSyVPDPbE3RhNmmQYi7+FH0rB2pHJTPewjIOoMhT1qJ23eNsUR2
 9kh2PDinUedzQo8depedRSpq0fIy2itqFDsuxCb1I8Img1989CC1i8oNraS1UQab0qh6
 UkIcqdeIMThisq7S+qJ2CSryohNLazPICO5ezzv/Q2Hk/1tpfbBYWKSIgTz+wbokzzVV
 navNILW4E5pnORgJ7UlBNl3f9FZ13b0Jmgb6i65TktzN1K5ALDCF+/t8AjXmEYrgxVuT
 Cisg==
X-Gm-Message-State: AOJu0Yy1k7lJjk+zFyxaOHGJcGEQaN/kgGWz4qqUD5Lx+MNgndpaqFvz
 ZrrzxSbp9D2+SytXN+ditng=
X-Google-Smtp-Source: AGHT+IFjbgI2p7VIOt+A7f05oIS5iZ+7BHD5jL8GSbm3gtDeDn6DEJ4gzH5WlS5acf6oV4/HaPfRgQ==
X-Received: by 2002:a17:906:530c:b0:99d:f056:5d6b with SMTP id
 h12-20020a170906530c00b0099df0565d6bmr8124022ejo.20.1694417776464; 
 Mon, 11 Sep 2023 00:36:16 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
 by smtp.gmail.com with ESMTPSA id
 ga17-20020a170906b85100b009a1e0349c4csm4892779ejb.23.2023.09.11.00.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 00:36:15 -0700 (PDT)
Message-ID: <d3a92651-d427-af84-70c2-bc6004e79c80@kernel.org>
Date: Mon, 11 Sep 2023 09:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230906151547.840302-1-valentin.caron@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230906151547.840302-1-valentin.caron@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: add support for break
	control
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 06. 09. 23, 17:15, Valentin Caron wrote:
> From: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> Add support for break control to the stm32 serial driver.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

LGTM

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

-- 
js
suse labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
