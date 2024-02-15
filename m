Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331C855FF1
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 11:47:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20C97C64102;
	Thu, 15 Feb 2024 10:47:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3033CC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707994046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4lm03LnxC3OUh/TJ2baKEgkE4+9W2WtmyGQNUlzO8Ec=;
 b=DKWeeFPwvmRcf0LGSWzmSm/0GF/vIa/5YAOr0NigaMnaCKMEi697Yd2h9/Du9so+G832mm
 jK9TPipOKfbGo7RR/82ahYWJRae0SFp5jMJNjbaYzWXhRguC/RNMoGwUaRkgeAlSESVUGJ
 d1kl8Gr4Js9hOm+9X1/q1iRyLj/GihM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-X3_B5YlePcCxkEzaTMyRlA-1; Thu, 15 Feb 2024 05:47:24 -0500
X-MC-Unique: X3_B5YlePcCxkEzaTMyRlA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-51161bd080aso254279e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 02:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707994043; x=1708598843;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDI9baZMetrqyJo1wIZ/D/RqqsOmJwsksCZtQl0+Oxk=;
 b=ex9BhStzSNn+xteeYT3xl7CajHRQkWdGk/eDYd9jxgVrayLL9mBlL4bW+r75xud51b
 ieXYqM+twpoKz+yzyRD9QC9oFByXuGTNaNo7sQO/BypwqWwUXE91E8n9PUIv9srkjb6v
 q+IsAxgkjBGYw4zJ0DSuCI5bXLbyHt8bI3q4JHCeaXTwslIPffiOjgaoDRgyKS9+ekbc
 pWArEftuFC1TGu7iNoIR2Ez5htn9zYvVaB5KGfGNHgFPczwNqhKsJ+NBqMfPuWN+WGGh
 Dom/5CgSAfwb34CUW/9Gp7H051yAQyk/kAu8R0AZ4T0uRbO1FOoNWQ3rJ4lB8km8htHp
 eiCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMXV7zSmqIEMFHOE/WR6QVH4RUjNnjT/057dN4HNC57sxOtQ0+KQYRTi+GHEpzdkOhJGuIxsqhW3hiWq03pt4zUiwZ7uXuv7FGOvpoD0gQhljBTObf3UVP
X-Gm-Message-State: AOJu0YylE2PbrLfWFncLvywaJ6ekccgVlhJFIp1xdk/VDs+5iR/9xbKV
 bZ83/Ycew2ZC61BMowKUhnZNth1k+DnYdnzlIGkk7yhEBkSlKijZOXeiLU6ddDWD+444bJX6ayE
 FOWBh/tlWJwmttf9q3uiPQoCTdQOFRXw0u9DeyZNw++ziRynZa42ipQJPqEMVNkMBWwYo7xZCOX
 sfwg==
X-Received: by 2002:a19:650e:0:b0:511:8819:e8be with SMTP id
 z14-20020a19650e000000b005118819e8bemr815454lfb.6.1707994043040; 
 Thu, 15 Feb 2024 02:47:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnpAB0DvqRdkJX5tH+4WWOj5F+ve231YQXDISI3lMCd0A3ewMnH3ZhmD55UrEuT5V+RwMbGA==
X-Received: by 2002:a19:650e:0:b0:511:8819:e8be with SMTP id
 z14-20020a19650e000000b005118819e8bemr815440lfb.6.1707994042659; 
 Thu, 15 Feb 2024 02:47:22 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-227-156.dyn.eolo.it.
 [146.241.227.156]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05600c21d100b00410b98a5c77sm4580112wmj.32.2024.02.15.02.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 02:47:22 -0800 (PST)
Message-ID: <3e15fbcc6cc87f4bafea8bc0a7164366cb1f4439.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Mark O'Donovan <shiftee@posteo.net>, Jacob Keller
 <jacob.e.keller@intel.com>,  linux-kernel@vger.kernel.org
Date: Thu, 15 Feb 2024 11:47:20 +0100
In-Reply-To: <867da21e-7f30-4caf-9f78-260d426e4186@posteo.net>
References: <20240212154319.907447-1-shiftee@posteo.net>
 <44c29a45-86fa-4e41-b4b5-e69187f0712e@intel.com>
 <867da21e-7f30-4caf-9f78-260d426e4186@posteo.net>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=mQINBGISiDUBEAC5uMdJicjm3ZlWQJG4u2EU1EhWUSx8IZLUTmEE8zmjPJFSYDcjtfGcbzLPb63BvX7FADmTOkO7gwtDgm501XnQaZgBUnCOUT8qv5MkKsFH20h1XJyqjPeGM55YFAXc+a4WD0YyO5M0+KhDeRLoildeRna1ey944VlZ6Inf67zMYw9vfE5XozBtytFIrRyGEWkQwkjaYhr1cGM8ia24QQVQid3P7SPkR78kJmrT32sGk+TdR4YnZzBvVaojX4AroZrrAQVdOLQWR+w4w1mONfJvahNdjq73tKv51nIpu4SAC1Zmnm3x4u9r22mbMDr0uWqDqwhsvkanYmn4umDKc1ZkBnDIbbumd40x9CKgG6ogVlLYeJa9WyfVMOHDF6f0wRjFjxVoPO6p/ZDkuEa67KCpJnXNYipLJ3MYhdKWBZw0xc3LKiKc+nMfQlo76T/qHMDfRMaMhk+L8gWc3ZlRQFG0/Pd1pdQEiRuvfM5DUXDo/YOZLV0NfRFU9SmtIPhbdm9cV8Hf8mUwubihiJB/9zPvVq8xfiVbdT0sPzBtxW0fXwrbFxYAOFvT0UC2MjlIsukjmXOUJtdZqBE3v3Jf7VnjNVj9P58+MOx9iYo8jl3fNd7biyQWdPDfYk9ncK8km4skfZQIoUVqrWqGDJjHO1W9CQLAxkfOeHrmG29PK9tHIwARAQABtB9QYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+iQJSBBMBCAA8FiEEg1AjqC77wbdLX2LbKSR5jcyPE6QFAmISiDUCGwMFCwkIBwIDIgIBBhUKCQgLAgQWAgMBAh4HAheAAAoJECkkeY3MjxOkJSYQAJcc6MTsuFxYdYZkeWjW//zbD3ApRHzpNlHLVSuJqHr9/aDS+tyszgS8jj9MiqALzgq4iZbg
 7ZxN9ZsDL38qVIuFkSpgMZCiUHdxBC11J8nbBSLlpnc924UAyr5XrGA99
 6Wl5I4Km3128GY6iAkH54pZpOmpoUyBjcxbJWHstzmvyiXrjA2sMzYjt3Xkqp0cJfIEekOi75wnNPofEEJg28XPcFrpkMUFFvB4Aqrdc2yyR8Y36rbw18sIX3dJdomIP3dL7LoJi9mfUKOnr86Z0xltgcLPGYoCiUZMlXyWgB2IPmmcMP2jLJrusICjZxLYJJLofEjznAJSUEwB/3rlvFrSYvkKkVmfnfro5XEr5nStVTECxfy7RTtltwih85LlZEHP8eJWMUDj3P4Q9CWNgz2pWr1t68QuPHWaA+PrXyasDlcRpRXHZCOcvsKhAaCOG8TzCrutOZ5NxdfXTe3f1jVIEab7lNgr+7HiNVS+UPRzmvBc73DAyToKQBn9kC4jh9HoWyYTepjdcxnio0crmara+/HEyRZDQeOzSexf85I4dwxcdPKXv0fmLtxrN57Ae82bHuRlfeTuDG3x3vl/Bjx4O7Lb+oN2BLTmgpYq7V1WJPUwikZg8M+nvDNcsOoWGbU417PbHHn3N7yS0lLGoCCWyrK1OY0QM4EVsL3TjOfUtCNQYW9sbyBBYmVuaSA8cGFvbG8uYWJlbmlAZ21haWwuY29tPokCUgQTAQgAPBYhBINQI6gu+8G3S19i2ykkeY3MjxOkBQJiEoitAhsDBQsJCAcCAyICAQYVCgkICwIEFgIDAQIeBwIXgAAKCRApJHmNzI8TpBzHD/45pUctaCnhee1vkQnmStAYvHmwrWwIEH1lzDMDCpJQHTUQOOJWDAZOFnE/67bxSS81Wie0OKW2jvg1ylmpBA0gPpnzIExQmfP72cQ1TBoeVColVT6Io35BINn+ymM7c0Bn8RvngSEpr3jBtqvvWXjvtnJ5/HbOVQCg62NC6ewosoKJPWpGXMJ9SKsVIOUHsmoWK60spzeiJoSmAwm3zTJQnM5kRh2q
 iWjoCy8L35zPqR5TV+f5WR5hTVCqmLHSgm1jxwKhPg9L+GfuE4d0SWd84y
 GeOB3sSxlhWsuTj1K6K3MO9srD9hr0puqjO9sAizd0BJP8ucf/AACfrgmzIqZXCfVS7jJ/M+0ic+j1Si3yY8wYPEi3dvbVC0zsoGj9n1R7B7L9c3g1pZ4L9ui428vnPiMnDN3jh9OsdaXeWLvSvTylYvw9q0DEXVQTv4/OkcoMrfEkfbXbtZ3PRlAiddSZA5BDEkkm6P9KA2YAuooi1OD9d4MW8LFAeEicvHG+TPO6jtKTacdXDRe611EfRwTjBs19HmabSUfFcumL6BlVyceIoSqXFe5jOfGpbBevTZtg4kTSHqymGb6ra6sKs+/9aJiONs5NXY7iacZ55qG3Ib1cpQTps9bQILnqpwL2VTaH9TPGWwMY3Nc2VEc08zsLrXnA/yZKqZ1YzSY9MGXWYLkCDQRiEog1ARAAyXMKL+x1lDvLZVQjSUIVlaWswc0nV5y2EzBdbdZZCP3ysGC+s+n7xtq0o1wOvSvaG9h5q7sYZs+AKbuUbeZPu0bPWKoO02i00yVoSgWnEqDbyNeiSW+vI+VdiXITV83lG6pS+pAoTZlRROkpb5xo0gQ5ZeYok8MrkEmJbsPjdoKUJDBFTwrRnaDOfb+Qx1D22PlAZpdKiNtwbNZWiwEQFm6mHkIVSTUe2zSemoqYX4QQRvbmuMyPIbwbdNWlItukjHsffuPivLF/XsI1gDV67S1cVnQbBgrpFDxN62USwewXkNl+ndwa+15wgJFyq4Sd+RSMTPDzDQPFovyDfA/jxN2SK1Lizam6o+LBmvhIxwZOfdYH8bdYCoSpqcKLJVG3qVcTwbhGJr3kpRcBRz39Ml6iZhJyI3pEoX3bJTlR5Pr1Kjpx13qGydSMos94CIYWAKhegI06aTdvvuiigBwjngo/Rk5S+iEGR5KmTqGyp27o6YxZy6D4NIc6PKUzhIUxfvuHNvfu
 sD2W1U7eyLdm/jCgticGDsRtweytsgCSYfbz0gdgUuL3EBYN3JLbAU+UZpy
 v/fyD4cHDWaizNy/KmOI6FFjvVh4LRCpGTGDVPHsQXaqvzUybaMb7HSfmBBzZqqfVbq9n5FqPjAgD2lJ0rkzb9XnVXHgr6bmMRlaTlBMAEQEAAYkCNgQYAQgAIBYhBINQI6gu+8G3S19i2ykkeY3MjxOkBQJiEog1AhsMAAoJECkkeY3MjxOkY1YQAKdGjHyIdOWSjM8DPLdGJaPgJdugHZowaoyCxffilMGXqc8axBtmYjUIoXurpl+f+a7S0tQhXjGUt09zKlNXxGcebL5TEPFqgJTHN/77ayLslMTtZVYHE2FiIxkvW48yDjZUlefmphGpfpoXe4nRBNto1mMB9Pb9vR47EjNBZCtWWbwJTIEUwHP2Z5fV9nMx9Zw2BhwrfnODnzI8xRWVqk7/5R+FJvl7s3nY4F+svKGD9QHYmxfd8Gx42PZc/qkeCjUORaOf1fsYyChTtJI4iNm6iWbD9HK5LTMzwl0n0lL7CEsBsCJ97i2swm1DQiY1ZJ95G2Nz5PjNRSiymIw9/neTvUT8VJJhzRl3Nb/EmO/qeahfiG7zTpqSn2dEl+AwbcwQrbAhTPzuHIcoLZYV0xDWzAibUnn7pSrQKja+b8kHD9WF+m7dPlRVY7soqEYXylyCOXr5516upH8vVBmqweCIxXSWqPAhQq8d3hB/Ww2A0H0PBTN1REVw8pRLNApEA7C2nX6RW0XmA53PIQvAP0EAakWsqHoKZ5WdpeOcH9iVlUQhRgemQSkhfNaP9LqR1XKujlTuUTpoyT3xwAzkmSxN1nABoutHEO/N87fpIbpbZaIdinF7b9srwUvDOKsywfs5HMiUZhLKoZzCcU/AEFjQsPTATACGsWf3JYPnWxL9
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: xgmac: fix initializer
 element is not constant error
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

Hi,

On Wed, 2024-02-14 at 22:07 +0000, Mark O'Donovan wrote:
> On 14/02/2024 20:31, Jacob Keller wrote:
> > 
> > 
> > On 2/12/2024 7:43 AM, Mark O'Donovan wrote:
> > > GCC prior to 8.x gives an "initializer element is not constant"
> > > error for the uses of dpp_tx_err in dwxgmac3_dma_dpp_errors.
> > > Newer compilers accept either version.
> > > 
> > > More info here:
> > > https://lore.kernel.org/all/20240103-fix-bq24190_charger-vbus_desc-non-const-v1-1-115ddf798c70@kernel.org
> > > 
> > > Signed-off-by: Mark O'Donovan <shiftee@posteo.net>
> > > ---
> > 
> > I'm not sure whether the Linux kernel project has an explicit cutoff for
> > what versions of GCC (or other compilers) are supported. GCC 8 was first
> > released in 2018.
> > 
> > The fix provided here is fairly straight forward, and while I do think
> > the benefit of using builtin types vs using the macros is nice, I don't
> > see that as a strong enough reason to hold up supporting the older compiler.
> > 
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > >   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > index 323c57f03c93..c02c035b81c0 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > @@ -830,8 +830,8 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
> > >   	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
> > >   };
> > >   
> > > -static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
> > > -static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
> > > +#define dpp_rx_err "Read Rx Descriptor Parity checker Error"
> > > +#define dpp_tx_err "Read Tx Descriptor Parity checker Error"
> > >   static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
> > >   	{ true, "TDPES0", dpp_tx_err },
> > >   	{ true, "TDPES1", dpp_tx_err },
> > > 
> > > base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
> 
> Thanks Jacob.
> 
> The minimum versions for compilers and other tools are documented here:
> https://www.kernel.org/doc/html/latest/process/changes.html
> 
> I am using a SLES 15 server to build, the first version of which came out in 2017.

Note that we already have net commit
1692b9775e745f84b69dc8ad0075b0855a43db4e addressing this issue.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
