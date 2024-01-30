Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 499CF842468
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 13:06:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 032DAC6C820;
	Tue, 30 Jan 2024 12:06:34 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04232C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 12:06:32 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6e1196dc31bso1649955a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 04:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706616391; x=1707221191;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6VQPImZ/4IQm9KIxbi2fxjRtKvipwSecgsg8i7If4Jc=;
 b=Q6WSQh8oHi5EzVRhNG1L2eorc86goQNwZVsAVd7SgbU9dZaRsaDOLTELWe9PqEdFnp
 7PITGezx+f+5cRuuRgvetY5a9QSoTX4Fjgjik4sU2ZRr5SVgX/yui+AnCB1pS2OiEi6/
 Bvb8rlpwikTjerDXXVSRuROVt010Eh4NMiiOjRlJdBTbGpyLO2xkpN1MseY0tee3g8EA
 be5ysMz10dI/wvJNADg8sCes6jJ4w8Ei2J4m4B3LlLMd4fSj+g0PClGlS9yxGqa3lL+u
 bKvZMCdadLj2eDvLxwielqKJyQCBtpVOmtZ712gZjbIsqRZr/GWe/CBy0ytEdj5FqIgQ
 YP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706616391; x=1707221191;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VQPImZ/4IQm9KIxbi2fxjRtKvipwSecgsg8i7If4Jc=;
 b=nqx4kEKcMoSJiWOM0VQ1HvlRZkSDaqNl42WY5A0oEMFysmDuCdcz2ob9SEdroMlx2H
 0MO85rFeYmF16q/W0rDgdESpXn5ec0GRFlC5yj90OqfxsxrUL05xJfKj/5lOA5RZC+lc
 5OgtQfepplNffoKKaY7Kmmgp1XwtqcYniuzCvJGjwF5yOPLqGVqyWWzzuq98FVi4y1po
 4Jsx+vPy8iw4trJVSDReZBZczF/Rff1Z4dOROa5ts8XzFeqLl5iAKFhp0JWm4LjrHUwV
 GyO0LXgL9q/HaulvPWiR7YCkIpETyvWWW0Ss4VyKO+1Gproce2gvwP3Z3nGIVlz9yOZl
 8oVA==
X-Gm-Message-State: AOJu0YzafnZdORpC/ep5T7MpKRVE4TWUs39XZTn0Pc8Lv9Fs9ScAexAA
 CeAAoXhJU3z6uj2WPuaYF3Mas2I4z/MF2fn2JJ3sRdC9XYZQL/+oxd0b1yPNpj4=
X-Google-Smtp-Source: AGHT+IFaIOEigDgFT/5QQbdDQk5NbtpmVP0pGHFyvEoSZT0SYMoAUi2j7U7q3LV4g9f19uwS7KMz5A==
X-Received: by 2002:a05:6830:14e:b0:6dd:c918:b9dc with SMTP id
 j14-20020a056830014e00b006ddc918b9dcmr7418443otp.22.1706616391729; 
 Tue, 30 Jan 2024 04:06:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVGnfi0kUIop1brl7MA5GjZg4Hw9TytnsDqbLapiK3kXUSDG7HIOtJ+zmS+kiSUnGuQQsLeCNB84sYNk9QT2NE5s5ctcFERZByhCLCOEX7kPZvc2S0gauu1N8noBs3XWLwhu/zzj0JTy79UwF/LzO1oSPZYRp6oYuVa5Hlp8obk4hbDrjTmWzef18XayKbXWY7kHpq5CfI39fgjqDmFOw5lJ+AzvfNW+4BckdE+qRIlblnNDlGZUer5e0/m+qNMIXttziXduQdfBKw7UNyakEiC6YUavD9rBI6fXF5qq98CMDujml6O43IQ66sOuY28Rl3Gqz8tYIUyyO3ezKIxdmIJWjWhQ+ujO5i/rJosI05KuBx8kdKn+3dH7WPKXWolvXXbQHvu+YLuT7QH+4m0a2fhwZ8V69pVxFBkO/IsdcdBpcUmSP8amgHH2lzoRo0UIQHJIa5XHnMlopry3MRebqNiFVxEdBiXKpNtaAbO4rnXyyPGITh7PssRnTMFmHSrgV3hY/dQiCqlp/8LbuQtL5jQcEMLnTg8gkfrH9Bs1jXd/BraW8lfynWw2O7DJqUMYVgY4loU3T/dhzeWq5J8I4RNfYyUgs1tgnJSFLBG7E5SAMGaWzmVjohJr4dhochatS2rMNqFqHyeVsA06AcdQZdk5whs4dRvZ1PMHvdfzy0D/4mFc4ny3XilAulwFwNt0y6x9TvY/3vwsjErFQObohLH9epGVbBzgexznhUKXhfkaOeEe4Rif9Ivcf6gnqf1ppPsXYHtD/J9FlXPfg==
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 bz9-20020a05622a1e8900b00429d3257dd6sm3274367qtb.45.2024.01.30.04.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 04:06:31 -0800 (PST)
Message-ID: <a320fa4e-937e-4ecf-9d28-54cc999dd334@linaro.org>
Date: Tue, 30 Jan 2024 13:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney
 <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
References: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
 <20240130120306.4120632-3-quic_jsuraj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130120306.4120632-3-quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v12 2/3] arm64: dts: qcom:
 sa8775p: enable safety IRQ
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

On 30/01/2024 13:03, Suraj Jaiswal wrote:
> Add changes to support safety IRQ handling
> support for ethernet.
> 

You still keep sending the same and ignoring comments.

Still NAK.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
