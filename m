Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F03842439
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 12:57:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E41B4C6C820;
	Tue, 30 Jan 2024 11:57:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B422BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 11:57:27 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55817a12ad8so3965996a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 03:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706615847; x=1707220647;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxgM5kktWvhN2w25/56fYWOdVFlRlmsv8vzO6AkG6kw=;
 b=j5veew9oQKipbvVYsi5D7l7kbGaSuNWl8+YJ9RsyUZYAZjWdoEXWMvOe+LihbPxm5i
 XFLFUloYiw1d0JKHI5CrjMO5CdTHShdFO3ruos8Dvk7+9hg3F0jbh8v4y7f2fgp+9pw2
 mEv9j0ZKF6VQknv+xE9HC4uAwjQNdmYGRkF+nhbFFV65Clz3ysBz5zEmKmEIw5EV1eh+
 TKEVEceLeCMwfxqlLA+R0rZooCTOmJyhFGdX1c2bBMFgCMsYhwvnSRlnpp3dw60rdvdW
 ZuIcrUWZF1JCVYY1a3BN0mn6TlQa9LtG7vhGH6YmOwGpcE9jYr20FLkiNJC2emdEsOBO
 /THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706615847; x=1707220647;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxgM5kktWvhN2w25/56fYWOdVFlRlmsv8vzO6AkG6kw=;
 b=vdUCTwYY/pPwDvqf8jb3+le6NrJ/f5QroKkvuVHPvyfo7KSqt7QZRFOTwGDgHhPjT5
 ORB1+9cjqZktuTm9Ri4ZaEFgSYWMdudMcnNK5Es27ePBWe2QFXC50Fus6qgYYsxC35ng
 boRYNAdxA0kO6J8NDdnUwALmJ4GqvjQvO+h8T31ig3PbNZF0IJ4cubeoiWlMShi3ZB2t
 Ns7rNCRKcX884Tyj6wJWs2ghtT7iaQdFr70clDrtaxi9+61d7vY/JwpYw72PFW0IxTyS
 K9c+I1c+Ocmsd3Rn3JprC7eLnvNLUIL9wWyzEIDlsdraV8SH3tnptL4/zVCHWC5rgrXO
 6WyA==
X-Gm-Message-State: AOJu0YxU6yIwBVlagjKxEw2wNqKfI1gKV6BxGCPWEiMmdP6vDv1SqEh8
 5mTidzQ/lLMLNsQ9cHE3yjU7ie6ZfOZzdYsCK+8qSBgCaCeOvu0wSNSj0Et2Wdo=
X-Google-Smtp-Source: AGHT+IF1F08ZntrtXaFyxdA7jLj1HYHz9j6xcKeHsk/iufbTeHvIh16YPQZeHOgI712uzqcJ/DBARA==
X-Received: by 2002:a17:907:7656:b0:a36:2df:5ded with SMTP id
 kj22-20020a170907765600b00a3602df5dedmr2008663ejc.72.1706615847139; 
 Tue, 30 Jan 2024 03:57:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXZUJtUyQ/vL5MwD2eZitFUhCNH2NI+X6Xk21ahRksW64edPD4h4r94tUKPG8BUKsPKk7PCyoO4mQbRc8EkYokE2fiLECIHdCpVOOuEwm/vtrLQWMPVNkdjjF/4JUtiwgakbTOH2kFdJFF2CX4jZWX3cuNGtZ/caT3DFIQOjTMWLIRJQ0qf5g+plhozootZ74W/nyjeKYC3pY9zXoisCB2OQPKE130BawTFyv1eKy4sCXOXeOEjMf6VVZkckF1xumHzrlTvo5ecfNUXnhabQOpTddI3utxgt1PflrX2VZy3ltI5UsB89AZDZ4YT/UQW90siib8VQEkcPffrReyo3GBPPtNycLptLiXq4UwEwo8xPlzIwneOiUIRHDVcTMe2eF5tt0g6g+PiwAv4WPiPaosEbIatM2mgCBl+H0tEgubZ/xYeX/UFWaTqC5Dpa2SvYQOiYPe+YO6hV6uLZ2CvCHulV8CxskAPvavJ45jWTevTlGPHh6rRa3uZ8HzuwIv24ct+QsIz5pdrJVZhxpQ6huyvD5M8akfJSHQSapbjMZf3W1QXC4mVcapMyyFKkCesHDYpabqDIo7ySliGZtptp9xCLuUYZFBkK7V4VZE+7pFiXPw1S8XCBAXB5sOBpWQuB7i3Gr8jrse6mcv/PQB4YAmbz/wDPH+FyWo0FpRKEfpwAMYCH4+4VDSn9ytVFyRJtxZD8UJEWgxsuTQA8qmYXaCC+yPOAImPUcGIAKEVGPvBmrUYeDKCn8cHneVbAwnlu+8GMfUvaKYerIyr6Q==
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 pw18-20020a17090720b200b00a35c1d11621sm2016372ejb.131.2024.01.30.03.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 03:57:26 -0800 (PST)
Message-ID: <a03839a4-7f5e-44dc-a719-149795ed952b@linaro.org>
Date: Tue, 30 Jan 2024 12:57:24 +0100
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
References: <20240130114102.4116046-1-quic_jsuraj@quicinc.com>
 <20240130114102.4116046-3-quic_jsuraj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130114102.4116046-3-quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v11 2/3] arm64: dts: qcom:
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

On 30/01/2024 12:41, Suraj Jaiswal wrote:
> Add changes to support safety IRQ handling
> support for ethernet.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

NAK.

Read the replies you got. This was applied and anyway it is not
next-next material. Please do not send DTS patches to net-next.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
