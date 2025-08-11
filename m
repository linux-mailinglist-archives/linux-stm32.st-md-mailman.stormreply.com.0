Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8CB20965
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 14:54:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 772C1C32E8E;
	Mon, 11 Aug 2025 12:54:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB49C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 12:54:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-61539f6815fso683734a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754916875; x=1755521675;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lAJkrzYbYXDdUOmXoNrO2X+aQxNISX0LyszDf4L6FM=;
 b=vKWdM9BKVqT36n5OBumPu8f2tQ5v01B9vqOv15bfbtCIP6zpcyARePzK8fnfE+VZLU
 ZOolvYghkb561V65s4PTeef2l4WipiFW7FNiLIcRe5yA8my2pit7GjOB1FOi8Hofg8LP
 hk0NINDehDJ1H2qaYhl0v8it3ireEjPpHjlBmWUPNarwadjmEBfTxz7VTZfCCp5YlkbM
 Idaauz30HVlPiotoTZrPpbGQfPPMEsI7ilpiBcSGVOddoqLXI128u3ng7N9eAZRpc2qK
 O4FW+r/mVo2Gg4ImQvtr2gAFlWAZigLd3MelWRMmsAR9pJ7N2GtwlSCSla2A8e9rDSkP
 BPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754916875; x=1755521675;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lAJkrzYbYXDdUOmXoNrO2X+aQxNISX0LyszDf4L6FM=;
 b=IP8VdjcRJWBgFXNsLlFjEamKdM2xwGYz9CzEPiQzNprXZeDc4RytoEQEEXKJJ0Y0BP
 FYYXz4rQcIGY6CyPHhbftI8KwhOJMeDxrtBHXdgZkFvHAPiKqkol1YFPqeacS+nlD5jl
 Bth493jxMPUSp9+mj43fO0oVUlx46/HWAZAvVY/nbHhEBtVAFKZdWu8geGcmSJc5TkZ6
 o8zfdo1LnCh54GUs8KvOoLaRFOeMfRWAiHcjggmZ1rfU5JcRsDLgw/PN2X/gY+YbVblm
 wwNlpmfgrmjvqhzY3F+fA/Gk3QGXLOthdBs3T9Xf9r7TjkNyxfyzL++RImeYeR52U2M+
 gw/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5qTq+xTJcNnFjkQpwecfFkgjqM2ClP6DdBP1FgNWT5doOd1Q0Ku9g47fhylDnQJd/hx30i0iF9IPQWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyyJVc7f3kJjVgAqcBxLjppoOP/KWES7sUaIN7SmceYSxktMUNr
 IprhRvYYVJdiXm3fGG8gSnP8vs8u1cwsIFudXwqzYBDoppt7pvveTjOJ5OGE7rgcXN0=
X-Gm-Gg: ASbGnct2w9uOr9P1usGIqhKiYlxZbk+3oAaNjOZYwHigx0pHqH71Pb0CYkoR3tCVzCT
 NtnPD5JIzvWSiORdTzcowr8Db1z1gGufXlYDAR28qdlEG4z/hdAX+tLZbnXiO2Hzu7rdRSrfVyz
 oT/J8ZBFtAD5y2PRX4EydjeojKg0/AoeiQuwOC5SgAgk7HmD/STxkcRjhV+guBltSXgovdM7Fud
 dW37Mfz3uPmDqAFFvhiCZE17aALlwYkA+67nC/xW8b+eixng6athb5KBeP2LeB8QZNrhmmzh1CO
 u24sOJTexr+AsUatek/+eYLXtHXjt/x0jnGQUaYoYp+nSmkwIwWVAAZGuHzNpZoL1qiAyXZRVHE
 rehAEMljJEdBjr896mieGSkf47HeS0PuzhZBxdP0=
X-Google-Smtp-Source: AGHT+IECY43uJOlj+dSXwBjNh9vS3ub+xUvRPR3BQ9Imlbk17n5tAWIN4VtFPlQp6xo6pwqAMMQMiA==
X-Received: by 2002:a05:6402:40d1:b0:617:be23:1111 with SMTP id
 4fb4d7f45d1cf-6180afb0786mr3247729a12.7.1754916875030; 
 Mon, 11 Aug 2025 05:54:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18727470a12.13.2025.08.11.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 05:54:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
References: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
Message-Id: <175491687378.136727.8468527575102760404.b4-ty@linaro.org>
Date: Mon, 11 Aug 2025 14:54:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] memory: stm32_omm: Fix req2ack update
	test
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


On Thu, 07 Aug 2025 09:34:09 +0200, Patrice Chotard wrote:
> If "st,omm-req2ack-ns" property is found and its value is not 0,
> the current test doesn't allow to compute and set req2ack value,
> Fix this test.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Fix req2ack update test
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d140f3ba76ac98faad7f9b37ef5a3dcbd57f59e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
