Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF45ED5BC
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 09:11:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D1BCC63328;
	Wed, 28 Sep 2022 07:11:54 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D065C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 07:11:53 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a2so19010334lfb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1YC5uoRUHjlv9KudkG2S3BdKQ6+kwRJS+62mrDBTkJ0=;
 b=vvNCgSgXOYWQR6gpDU414goVmJvylFPTjGvqcMGYfeZCKNuGei6n9V8jAE/6gm2agN
 aHug4WTKBc5m6AqyJu9fEfYMkm6sElB2vYxMEWdM7dFKJF3lZCeESmRKr8iM4BzxCPJX
 MYcGNVi+8jlcQuyrwLpeKhNL8mb6Nt0lzpVUMVj+Ex+cgbthU+6/z2RujvbbqQGB0Sr6
 7eGYAez5VnCrJ5pEuApU0f740VbuOt2pkph5abApPBydx6xlf1h2dN8DTplRVCqXozqn
 SVBCwlQ0zVUXcCnWDJqgTXWiIdHoh+NlkhcvMDu9vAxYDFC0gdv4C7Fe0Uh8KzfHRjoM
 2bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1YC5uoRUHjlv9KudkG2S3BdKQ6+kwRJS+62mrDBTkJ0=;
 b=HV9GGOOkifIWYSaHCE1AODKCUrdnCefIl2IfugMgEoasQH59WnC46SwWcHVR1KfiMK
 8M67YqWEaN4jJSLXG/52o3NdAUpBIasX6M9DDXfQesB5clegY6wnWUZ/TsAM6n2w5Z3W
 jRca1dCbRnuO1u1W2wJnz8RoMnOxUOsC3B1vDuHANwhixDJAdc9zaweNNuy/QxfeWUWr
 4x4lYIzqe+StQqXtlNri2OzmOPTJsOOF7SXKjzZh+yY9vAzW42ejnz0VKmInosZ2ZQ/H
 B4zxfWUkq4N45DAdICipuJsnEELC83uMTWQDLc5Z5TjrIR+WC+mwfbWbjI334RlEhZTz
 V6eQ==
X-Gm-Message-State: ACrzQf0kBmKSp5TMr81tLlpY6cV+DFjyS4TFLlGYR5IFKsTjq2ls9bnp
 hzy17zwhUBCUfyd7zua8gIOFvA==
X-Google-Smtp-Source: AMsMyM4kDwFhn3XpYGWQTUkkZjWgslw857JjEChsxG915F3r97yYELg2M1N+/JjYzVp7a+vkC8YK0A==
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr12449879lfb.583.1664349112733; 
 Wed, 28 Sep 2022 00:11:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 20-20020a2eb954000000b00261e7244887sm347092ljs.60.2022.09.28.00.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 00:11:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	marex@denx.de
Date: Wed, 28 Sep 2022 09:11:50 +0200
Message-Id: <166434910296.10148.2597210651020575227.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926222003.527171-1-marex@denx.de>
References: <20220926222003.527171-1-marex@denx.de>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
	stm32: Fix st, fmc2_ebi-cs-write-address-setup-ns
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

On Tue, 27 Sep 2022 00:20:03 +0200, Marek Vasut wrote:
> The property st,fmc2_ebi-cs-write-address-setup-ns should really be
> st,fmc2-ebi-cs-write-address-setup-ns (there is underscore _ between
> fmc2 and ebi and there should be a dash - instead). This is a remnant
> from conversion of old non-upstream bindings. Fix it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
      https://git.kernel.org/krzk/linux-mem-ctrl/c/587f9891ec9661e16df7e5268543416a7d8cb547

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
