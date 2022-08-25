Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D85A0FE8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 14:04:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B51C5EC76;
	Thu, 25 Aug 2022 12:04:38 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D9C1C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 12:04:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id u24so13632463lji.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
 b=AC7iwM+IU6rZ2DikNLEp56ucV1olYMqe5wPpPx5IJcqfDfIwnjZsXq/r18dgvyR9gy
 VpZuBNdAqojv/7IkgmQLq2E8XyGHApvRu6J8P2q3nEPrFKj1UkdMqnL5TP6VdIY7j6Mw
 uORdf9m7tt4x4PGKy0ZA3snFXrGETle6kJDRZWR/RNcj/fawcnaYbOOzJgfBBzJbvYBy
 tQRDi9nBlFRZB7FOip+qeTQdHflXlM5s2JaZfH60KNK60c7aujOfOuzs++8nIWce4lSk
 /oJ/keczT8JhhPHJ1ybwzx4sm+o79v5xZU3u5Z+JzrJOTkQyTjYcX4vzv3P6u7aAnUpM
 41Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
 b=rrsYMGIAtnVvkzhBuvJYKVoQQUh2jkOJ9J4rUUxDgGu6kf69D/16Hv1rC2gNsJ0rll
 VnqzfS7F0IJVlmfZjtTVoRuP5FoXWzoB7JwvAi7q3e2XdZC+5xhYsjbJfvKZDCv4gBOm
 B/XK2a3PGPE4OM1t6/13x3xedSe5OZfzO1goBeu33d5DJzlR9/l1b7vKEobB30qLpGoI
 pLuhvNX2mCkCd/DALvFwKvKYb9wMETzti07tCuM2MDUSXcUZHNOMT3srzmSOi88hB36Z
 kUgMerrjV01cIIRMSaTdAVrfwxDB50GY4wc+wXK5qjQd3YNu9v8UOK9Pi9SK7O9ybXEY
 8MFg==
X-Gm-Message-State: ACgBeo2a/KorPYd7tatYMQu/MsXVSDlaIcVIyG1gQ5ju5rx5eb3UcdFI
 YTsbvpacsqMGVFZlIFl+dmrg8w==
X-Google-Smtp-Source: AA6agR42/GKcvjXHoKZTIcWaMOnISvqmUCz5H3K5w7VvlWmt0SgXX+Q+rpIDqNHTEiSTnkRLIymPBg==
X-Received: by 2002:a05:651c:2112:b0:261:b9c1:509 with SMTP id
 a18-20020a05651c211200b00261b9c10509mr1078828ljq.39.1661429076514; 
 Thu, 25 Aug 2022 05:04:36 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05651211eb00b0047f647414efsm460280lfs.190.2022.08.25.05.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:04:34 -0700 (PDT)
Message-ID: <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
Date: Thu, 25 Aug 2022 15:04:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>
References: <20220823145649.3118479-2-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-2-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
