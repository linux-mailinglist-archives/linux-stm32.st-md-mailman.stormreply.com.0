Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B593A8907B1
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 18:54:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6737DC6DD96;
	Thu, 28 Mar 2024 17:54:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93170C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 17:54:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1e0d82c529fso11716225ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711648469; x=1712253269;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oZvp/lITJDNWxOLYjQgBZB6pagg7Ik04GSqU8vqzwII=;
 b=hLwn/shnlekDxZ3J2nKyCioPZCqy2dCmJofpE6tEMbkPxki2epNHYaduBAJEXxqSQF
 ravqwrwutZDTroo0Y7gQwG5b0BqqxOSJjR8PH/MuB18MjXXFERTWWESetlqE4PVffO04
 3yvPElwwCZmsG6Yr0TMjcWnwdTOhASgwF2MEoDW/l6sBavT5o6aM07h0py2i7j4w4uO7
 tp9YKzo3tOJvdGdqV54uosyeP9hhisv2EzljLwDw8x28oxdTzluKjMFTVbn2P+ggXYAH
 weYwozsA7AzbkgONi43mwYvjhki9CcNy7cApzWpnuuMh5QGlbDaEGymFB/GdXvZLUP9j
 2G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711648469; x=1712253269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZvp/lITJDNWxOLYjQgBZB6pagg7Ik04GSqU8vqzwII=;
 b=RYiT5Sj7iBuRRtDPyDBIpzvCqrk5aHadFUTWDILSELkwWSTvgLtXK75AhDuUKvYhD5
 RKNp9ZeAbp6ysjXu08Dk+xZWvmKOLLJhk42xhkXiozQjnm01x/auQiU3BdheeYWRMmbW
 J4YCbtoFS5eL4V/qpH990ZsaHbUuH8G9OBpqOwEYUR34M5oboWVPnZyxJIXzmwD8svd2
 COOU8oMJaeHnpscN5+FUxzKye3uKOb10caMs93dR92EGWpyQN0IyEBQW+s7U1YlClPbA
 z7o58kp1U9SClmeNj25ydgIONbOG2H+6yFLD0uCbqGH9hLfj3b2r7SCNfQmrlerRScPg
 oIGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm4rPN4xq+ddo1g/YXRq5gAhf3hiP13sOhFfr2rTYigPB9WHclSa7ygpLqIJajW55hG6PMkXq/feJDGQUO7JkihZrebfGMkBNaB7jlXLFJv12pwsazZbWj
X-Gm-Message-State: AOJu0YxriVdJbCJo7Ii5htk/lyp+H2RMl86kxt2lAjGSvtdls+wzqenl
 dCBgRosQJjZDsiuFF7Ou+xv0o4QvhSqdhxDwymOfuTva9MVPOYLu
X-Google-Smtp-Source: AGHT+IFRMQqdaniMo9xyMzawxw0tFu+l7drmFv/DHiNd03hzItm5qnsMz3xD1cRBeIVmDfNxU4ri3A==
X-Received: by 2002:a17:902:b08b:b0:1dd:bf6a:2b97 with SMTP id
 p11-20020a170902b08b00b001ddbf6a2b97mr129367plr.60.1711648468849; 
 Thu, 28 Mar 2024 10:54:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170902c64200b001e0e8e4f7e3sm1895787pls.206.2024.03.28.10.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 10:54:28 -0700 (PDT)
Date: Thu, 28 Mar 2024 10:54:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgWu0ouzKLIS7tHI@google.com>
References: <20240327174655.519503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327174655.519503-1-krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmpe - drop driver owner
	assignment
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

On Wed, Mar 27, 2024 at 06:46:55PM +0100, Krzysztof Kozlowski wrote:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
