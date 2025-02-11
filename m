Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC6A309F2
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 12:31:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DB3EC7A820;
	Tue, 11 Feb 2025 11:31:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00280C7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739273466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
 b=iRcdmmU9qqev8AtTQGqwZUv0F4lvJCCrGCbZMwiqng7VBiv/0u04xAEC6EXqPDUMeKh8/M
 zNXWxur0wnBMXvWb/OcBV+5yTb3rY8GqBpUuBBb+PUNbHwhN0lpm895AZvY/RYjVN6aI69
 VpTKCmsJGVo1AI0X81+GjgHFk+kmgfY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-CJdnEkMzPMmDt95LGlj4sA-1; Tue, 11 Feb 2025 06:31:02 -0500
X-MC-Unique: CJdnEkMzPMmDt95LGlj4sA-1
X-Mimecast-MFC-AGG-ID: CJdnEkMzPMmDt95LGlj4sA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dda790cfbso1889560f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 03:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739273461; x=1739878261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
 b=V+lnQUC4LqZDxWK0r3Izs6LjVzxZoezPQJisoergDxAMhO/6JFqDcEr5C7IhhXF234
 FDxLEgtH+HneidovywItxAy7qzb8hAD+RLAOr2rnP5xaqoiZFu768kjCNoPMVVrE8kGr
 9EMOI9tXAtFCas1tsfQw8S7qz91z6ghHHQ0xmJ8qF5MwX0zf09eWoIY6RckTLOb9UGF5
 49P0+QwcpZ7SX29rYUyDu5LtuoSsh/MS+7YJ2XEsett7RQ1XvhTYcKPGKMaB11yzN16o
 3LnDadJWWFn5u+LPhKfjhUEgcCdmflQJkF6pfqLg0Wp/dwS8Mx0/No6r8jq1ib+saUel
 KdrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLoUkj5hSJX4vLqhvBJyRLqUMMXHEpbP5MYHRUJBnI3rj5k6wk/Ie/1iiLUOXCTe70tvi6aL5J6oqMXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy0JupsaDCZ+NzBT0RJRfAC+rBYOEPlf9CTYOTN3MZBJBVJhv+1
 DB8LKXidkZn6mBMc+XJ/GVnOLeDrvBX9t5yAu6DZI0dEd9m2GuvmS06IEvXxGbCBnpw4w/x6eAi
 FZMDs6bJekYTFdGaLSH2KBx7/eP7TJUYRhrkCZrGSSf8ejaYqjNqnMhYXgMLrML4fac+QVFL6UL
 +/6g==
X-Gm-Gg: ASbGncuzUL4+JYqoK/3XKJTJV8xbGGfVJdZygQkpOcsP+u30vOyBs+P11D6SPjeh4/k
 zu/lB5dsrJUQ5Pqp4h3ulFIwNdqI011RWmJYv3KVfIa07I9t8vwdROzA03f889XxKdovvewN2M1
 HuB8xr76+t/ZZl0q2l2YzKwQU7ySdTqLwMgzui7Nbppp6eAdujOheAflF4uTWQUaRKjujWZ29BO
 VrZw5TAruAzUJEmHp9f/zQecrVukH9xeld6GRh4YnbrAZeYkhyqSMywDKcXRjQIqpMdqSUy5AdW
 2cHqFEAVH/pbZ+zML4z5QzPXdk489/ZJxHY=
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id
 ffacd0b85a97d-38ddef88639mr6802198f8f.55.1739273461531; 
 Tue, 11 Feb 2025 03:31:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHayBvfNx73SbQMhbxNkafqfD+FDlmMiZt8eb9H+FDR01lT95RUPwq8zXQKROFW+H5GCWVS0g==
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id
 ffacd0b85a97d-38ddef88639mr6802140f8f.55.1739273461119; 
 Tue, 11 Feb 2025 03:31:01 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43941ddc8e9sm68421845e9.26.2025.02.11.03.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 03:30:59 -0800 (PST)
Message-ID: <6abfb27a-8116-4b15-9485-39e5b1f98c2f@redhat.com>
Date: Tue, 11 Feb 2025 12:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Swathi K S <swathi.ks@samsung.com>, krzk@kernel.org, robh@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, treding@nvidia.com,
 Jisheng.Zhang@synaptics.com, ajayg@nvidia.com, Joao.Pinto@synopsys.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, linux-fsd@tesla.com
References: <CGME20250207122130epcas5p1857043fa03e7356dc8783f43a95716ef@epcas5p1.samsung.com>
 <20250207121849.55815-1-swathi.ks@samsung.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250207121849.55815-1-swathi.ks@samsung.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LbxehpOBKechJs_r3pj1xlnv-B_27IjU-3PdUO8ndGw_1739273462
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: devicetree@vger.kernel.org, halaney@redhat.com,
 linux-samsung-soc@vger.kernel.org, xiaolei.wang@windriver.co,
 ssiddha@tesla.com, netdev@vger.kernel.org, si.yanteng@linux.dev,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, joabreu@synopsys.com,
 pankaj.dubey@samsung.com, peppe.cavallaro@st.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ravi.patel@samsung.com
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: refactor clock management in
	EQoS driver
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

On 2/7/25 1:18 PM, Swathi K S wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

For unclear (to me) reasons, our CI failed to pick this patch. I guess
the too wide recipients list confused the CI, I suggest re-spinning
including only the ML reported by get_maintainers output and adding the
target tree ('net-next') in the subj prefix.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
